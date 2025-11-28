# Data Creation for HPDM172 Group Assignment

set.seed(271)

# Data Imports and Cleaning

acute_trust_services <- read.csv('source_data/acute_trust_services.csv', header=TRUE)
addresses <- read.csv('source_data/addresses.csv', header=FALSE)
beds <- read.csv('source_data/beds.csv', header=TRUE)
cqc_inspections <- read.csv('source_data/cqc_inspections.csv', header=TRUE)

acute_trust_services <- data.frame(
  service = acute_trust_services$Sub.domain,
  org = toupper(acute_trust_services$Trust_name),
  type = gsub("^.{0,8}", "", acute_trust_services$Trust_subtype),
  domain = acute_trust_services$Domain
)

acute_trust_services <- acute_trust_services[acute_trust_services$domain=='Access to services',]
acute_trust_services <- subset(acute_trust_services, select = c(service, org, type))
acute_trust_services <- acute_trust_services[!acute_trust_services$service=='Access to services domain score',]
acute_trust_services <- acute_trust_services[!acute_trust_services$service=='Access to services domain segment',]
acute_trust_services$type[acute_trust_services$type %in% c('Small', 'Medium', 'Large', 'Multi-Service')] <- 'General'

addresses <- data.frame(
  org = addresses$V2,
  site = addresses$V5,
  street = addresses$V6,
  town_or_city = addresses$V8,
  postcode = addresses$V10
)

addresses$site[addresses$site=='BIRMINGHAM WOMENS HOSPITAL'] <- "BIRMINGHAM WOMEN'S HOSPITAL"
addresses$site[addresses$site=='KINGS MILL HOSPITAL'] <- "KING'S MILL HOSPITAL"
addresses$site[addresses$site=='LIVERPOOL WOMENS HOSPITAL'] <- "LIVERPOOL WOMEN'S HOSPITAL"
addresses$street[addresses$street==''] <- NA

beds <- data.frame(
  org = toupper(beds$Org.Name),
  level = beds$Level,
  metric = beds$Metric,
  no_of_beds = beds$Value
)

beds <- beds[beds$level=='Provider',]
beds <- beds[beds$metric=='G&A beds available',]
beds <- subset(beds, select = c(org, no_of_beds))

cqc_inspections <- data.frame(
  org = toupper(cqc_inspections$Name),
  region = cqc_inspections$Region,
  postcode = cqc_inspections$Postcode,
  accreditation_year = substring(cqc_inspections$Date.of.latest.check, first=8, last=11)
)

cqc_inspections$accreditation_year[cqc_inspections$accreditation_year==''] <- NA
cqc_inspections$region[cqc_inspections$region=='East'] <- 'East of England'
cqc_inspections$region[cqc_inspections$region=='Yorkshire & Humberside'] <- 'Yorkshire and the Humber'

# Hospitals Table Creation

hospital_table <- data.frame(
  hosp_name = rep(NA,40),
  address = rep(NA,40),
  num_beds = rep(NA,40),
  type = rep(NA,40),
  emergency_services = rep(NA,40),
  year_of_accred = rep(NA,40),
  trust_ = rep(NA,40),
  region_ = rep(NA,40)
)

req_num_hosp = 40
in_table = 0
num_options = nrow(beds)
untried_options = seq(1,num_options)

while (in_table < req_num_hosp) {
  opt_to_try <- sample(untried_options, 1)
  trust_ <- beds$org[opt_to_try]
  if (!(trust_ %in% addresses$org)) {
    untried_options <- untried_options[!untried_options==opt_to_try]
    next
  }
  location <- addresses[addresses$org==trust_,]
  if (nrow(location) > 1) {
    untried_options <- untried_options[!untried_options==opt_to_try]
    next
  }
  if (!(grepl('HOSPITAL',location$site))) {
    if (!(grepl('INFIRMARY',location$site))) {
      untried_options <- untried_options[!untried_options==opt_to_try]
      next
    }
  }
  if (is.na(location$street)) {
    untried_options <- untried_options[!untried_options==opt_to_try]
    next
  }
  if (!(trust_ %in% acute_trust_services$org)) {
    untried_options <- untried_options[!untried_options==opt_to_try]
    next
  }
  if (!(trust_ %in% acute_trust_services$org)) {
    untried_options <- untried_options[!untried_options==opt_to_try]
    next
  }
  if (!(location$site %in% cqc_inspections$org)) {
    untried_options <- untried_options[!untried_options==opt_to_try]
    next
  }
  if (!(location$postcode %in% cqc_inspections$postcode[cqc_inspections$org==location$site])) {
    untried_options <- untried_options[!untried_options==opt_to_try]
    next
  }
  hosp_name <- location$site
  street_address <- paste(c(location$street, location$town_or_city), collapse = ', ')
  address <- paste(c(tolower(street_address), location$postcode), collapse = ' ')
  num_beds <- beds$no_of_beds[opt_to_try]
  type <- acute_trust_services$type[acute_trust_services$org==trust_][1]
  if (type == 'Specialist') {
    emergency_services <- 'No'
  } else {
    services <- acute_trust_services$service[acute_trust_services$org==trust_]
    if ('Urgent and emergency care' %in% services) {
      emergency_services <- 'Yes'
    } else {
      emergency_services <- 'No'
    }
  }
  inspections <- cqc_inspections$accreditation_year[cqc_inspections$org==hosp_name]
  region_ <- cqc_inspections$region[cqc_inspections$org==hosp_name][1]
  in_table <- in_table + 1
  hospital_table$hosp_name[in_table] <- tolower(hosp_name)
  hospital_table$address[in_table] <- address
  hospital_table$num_beds[in_table] <- num_beds
  hospital_table$type[in_table] <- type
  hospital_table$emergency_services[in_table] <- emergency_services
  hospital_table$emergency_services[in_table] <- emergency_services
  hospital_table$year_of_accred[in_table] <- min(na.omit(inspections))
  hospital_table$region_[in_table] <- region_
  hospital_table$trust_[in_table] <- trust_
  untried_options <- untried_options[!untried_options==opt_to_try]
}

hospital_table$hosp_name <- gsub("(^|[[:space:],-])([[:alpha:]])", "\\1\\U\\2", hospital_table$hosp_name, perl = TRUE)
hospital_table$hosp_name <- gsub("Of", "of", hospital_table$hosp_name)
hospital_table$hosp_name[hospital_table$hosp_name=='St Marys Hospital'] <- "St Mary's Hospital"
hospital_table$address <- gsub("(^|[[:space:],-])([[:alpha:]])", "\\1\\U\\2", hospital_table$address, perl = TRUE)
hospital_table$address <- gsub("In", "in", hospital_table$address)

hosp_to_export <- subset(hospital_table, select = c(hosp_name, address, num_beds, type, emergency_services, year_of_accred))

write.table(hosp_to_export, file='hospitals.tsv',
            quote=FALSE, sep='\t', row.names = FALSE,
            col.names = c('Hospital Name', 'Address', 'Size (Beds)', 'Type',
                          'Emergency Services', 'Year of Accreditation'))

# Doctors

# These will need unique IDs since 2 drs could share the same name

# Patients

# These will need unique IDs since 2 pts could share the same name 

# Medications

# Prescriptions

# Diseases

# Appointments

# Lab Results