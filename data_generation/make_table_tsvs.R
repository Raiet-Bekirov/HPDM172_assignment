# Data Creation for HPDM172 Group Assignment

set.seed(172)

# Source Data 

acute_trust_services <- read.csv('source_data/acute_trust_services.csv', header=TRUE)
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
acute_trust_services$type[acute_trust_services$type %in% c('Small','Medium',
                                                           'Large', 'Multi-Service')] <- 'General'

addresses <- read.csv('source_data/addresses.csv', header=FALSE)
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

beds <- read.csv('source_data/beds.csv', header=TRUE)
beds <- data.frame(
  org = toupper(beds$Org.Name),
  level = beds$Level,
  metric = beds$Metric,
  no_of_beds = beds$Value
)
beds <- beds[beds$level=='Provider',]
beds <- beds[beds$metric=='G&A beds available',]
beds <- subset(beds, select = c(org, no_of_beds))

blood_tests <- data.frame (
  test_name = c('Albumin', 'Alkaline Phosphatase', 'Bilirubin',
                'C-Reactive Protein', 'Creatinine', 'Glucose', 'Haemoglobin',
                'HbA1c', 'HDL Cholesterol', 'Iron', 'Lactate', 'LDL Cholesterol', 
                'Lymphocytes', 'Magnesium', 'Neutrophils', 'Potassium',
                'Red Blood Cell Count', 'Triglycerides', 'Urea',
                'White Blood Cell Count'),
  test_code = c('ALB', 'ALP', 'BIL', 'CRP', 'CRE', 'GLU', 'HGL', 'HBA', 'HDL', 'IRN',
                'LAC', 'LDL', 'LYM', 'MAG', 'NEU', 'POT', 'RBC', 'TRI', 'URE', 'WBC')
)

cqc_inspections <- read.csv('source_data/cqc_inspections.csv', header=TRUE)
cqc_inspections <- data.frame(
  org = toupper(cqc_inspections$Name),
  region = cqc_inspections$Region,
  postcode = cqc_inspections$Postcode,
  accreditation_year = substring(cqc_inspections$Date.of.latest.check, 
                                 first=8, last=11)
)

cqc_inspections$accreditation_year[cqc_inspections$accreditation_year==''] <- NA
cqc_inspections$region[cqc_inspections$region=='East'] <- 'East of England'
cqc_inspections$region[cqc_inspections$region=='Yorkshire & Humberside'] <- 'Yorkshire and the Humber'

first_names <- read.csv('source_data/first_names.csv', header=TRUE)
last_names <- read.csv('source_data/last_names.csv', header=TRUE)

hf_high_impact_conditions <- c('Anxiety', 'Atrial Fibrillation', 'Bowel Cancer',
                               'Chronic Kidney Disease', 'Chronic Pain',
                               'Chronic Obstructive Pulmonary Disease',
                               'Depression', 'Heart Failure', 'Lung Cancer',
                               'Type 2 Diabetes')

medications <- read.csv('source_data/medications.csv', header=TRUE)

uk_postcodes <- read.csv('source_data/uk_postcodes.csv', header=TRUE)
uk_postcode_ins <- read.csv('source_data/uk_postcode_ins.csv', header=FALSE)
uk_street_names <- c("High Street", "Ash Grove", "Station Road",
                     "Castle Street", "Church Lane", "East Street",
                     "Church Street", "Moor Lane", "Mill Lane", "The Paddock",
                     "Church Road", "Wood Lane", "Main Street", "Manor Close",
                     "Green Lane", "Union Street", "School Lane",
                     "Alexandra Road", "New Road", "Market Place","Park Road",
                     "Church Hill", "Chapel Lane", "Highfield Road",
                     "Back Lane", "Water Lane", "The Green", "York Road",
                     "Chapel Street", "Albert Road", "The Street", "Grove Road",
                     "The Crescent", "Albert Street", "Orchard Close",
                     "The Orchard", "The Avenue", "Charles Street",
                     "Queen Street", "Brook Street", "Bridge Street",
                     "Hill Street", "Manor Road", "Chestnut Close",
                     "Park Lane", "Duke Street", "Victoria Road",
                     "James Street", "King Street", "Silver Street",
                     "George Street", "Springfield Road", "West Street",
                     "Park View", "New Street", "Long Lane", "North Street",
                     "Chapel Road", "Park Avenue", "Windsor Road",
                     "School Road", "Queen's Road", "Mill Road", "Beech Avenue",
                     "Cross Street", "William Street", "Victoria Street",
                     "Willow Close", "The Close", "Sycamore Close", "Main Road",
                     "Church View", "Sandy Lane", "Hall Lane", "Market Street",
                     "The Spinney", "Grange Road", "The Croft", "South Street",
                     "St John's Road", "Church Close", "Vicarage Lane",
                     "The Grove", "Wood Street", "Meadow Close", "The Meadows",
                     "John Street", "Vicarage Road", "Mill Street",
                     "Rectory Lane", "North Road", "Chestnut Avenue",
                     "Park Street", "Queensway", "The Drive",
                     "Station Approach", "London Road", "Mount Pleasant",
                     "The Square", "Edward Street")

# year_days <- 
# year_leap_days <- 

# Utility Functions

# add_from_region <- 
# blood_test <- 
# doc_bday <- 
# pt_bday <- 

# Hospitals Table Creation

hospitals_table <- data.frame(
  hosp_id = seq(1,40),
  hosp_name = rep(NA,40),
  address = rep(NA,40),
  num_beds = rep(NA,40),
  type = rep(NA,40),
  emergency_services = rep(NA,40),
  year_of_accred = rep(NA,40),
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
  hospitals_table$hosp_name[in_table] <- tolower(hosp_name)
  hospitals_table$address[in_table] <- address
  hospitals_table$num_beds[in_table] <- num_beds
  hospitals_table$type[in_table] <- type
  hospitals_table$emergency_services[in_table] <- emergency_services
  hospitals_table$emergency_services[in_table] <- emergency_services
  hospitals_table$year_of_accred[in_table] <- min(na.omit(inspections))
  hospitals_table$region_[in_table] <- region_
  untried_options <- untried_options[!untried_options==opt_to_try]
}

hospitals_table$hosp_name <- gsub("(^|[[:space:],-])([[:alpha:]])", 
                                 "\\1\\U\\2", hospitals_table$hosp_name, 
                                 perl = TRUE)
hospitals_table$hosp_name <- gsub("Of", "of", hospitals_table$hosp_name)
hospitals_table$hosp_name[hospitals_table$hosp_name=='St Marys Hospital'] <- "St Mary's Hospital"
hospitals_table$address <- gsub("(^|[[:space:],-])([[:alpha:]])",
                               "\\1\\U\\2", hospitals_table$address,
                               perl = TRUE)
hospitals_table$address <- gsub("Under", "under", hospitals_table$address)

hosp_to_export <- subset(hospitals_table, select = c(hosp_id, hosp_name, address, num_beds,
                                                    type, emergency_services, year_of_accred))

write.table(hosp_to_export, file='hospitals.tsv',
            quote=FALSE, sep='\t', row.names = FALSE,
            col.names = c('hospital_id', 'hospital_name', 'hospital_address', 
                          'no_of_beds', 'hospital_type', 'emergency_services', 
                          'accreditation_year'))

# Diseases Table Creation

# diseases_table <- data.frame(
#  dis_id = seq(1,10),
#  dis_name = hf_high_impact_conditions
#)

# write.table(diseases_table, file='diseases.tsv',
#            quote=FALSE, sep='\t', row.names = FALSE,
#            col.names = c('disease_id', 'disease_name'))

# Doctors Table Creation

# Patients Table Creation

# Medications Table Creation

# Prescriptions Table Creation

# Appointments Table Creation
 
# Lab Results Table Creation
