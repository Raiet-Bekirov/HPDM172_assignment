# Data Creation for HPDM172 Group Assignment -----------------------------------

set.seed(172)

## Import and process source data ----------------------------------------------

acute_trust_services <- read.csv('source_data/acute_trust_services.csv',
                                 header=TRUE)
acute_trust_services <- data.frame(
  service = acute_trust_services$Sub.domain,
  org = toupper(acute_trust_services$Trust_name),
  # Remove first eight characters reading 'Acute - '
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
  test_code = c('ALB', 'ALP', 'BIL', 'CRP', 'CRT', 'GLU', 'HGB', 'HBA', 'HDL', 'IRN',
                'LAC', 'LDL', 'LYM', 'MAG', 'NEU', 'POT', 'RBC', 'TRI', 'URE', 'WBC')
)
blood_tests$test_name <- paste0('Blood Test: ', blood_tests$test_name)

cqc_inspections <- read.csv('source_data/cqc_inspections.csv', header=TRUE)
cqc_inspections <- data.frame(
  org = toupper(cqc_inspections$Name),
  region = cqc_inspections$Region,
  postcode = cqc_inspections$Postcode,
  accreditation_year = substring(cqc_inspections$Date.of.latest.check,
                                 first=8, last=11)
)

cqc_inspections$accreditation_year[cqc_inspections$accreditation_year==''] <- NA
cqc_inspections$region[cqc_inspections$region==''] <- NA
cqc_inspections$region[cqc_inspections$region=='East'] <- 'East of England'
cqc_inspections$region[cqc_inspections$region=='Yorkshire & Humberside'] <- 'Yorkshire and the Humber'
cqc_inspections <- cqc_inspections[!is.na(cqc_inspections$region),]
cqc_inspections <- cqc_inspections[!(cqc_inspections$region=='Wales'),]

first_names <- read.csv('source_data/first_names.csv', header=TRUE)
first_names$Romanized.Name[first_names$Romanized.Name==''] <- NA
first_names <- na.omit(first_names$Romanized.Name)

last_names <- read.csv('source_data/last_names.csv', header=TRUE)
last_names$Romanized.Name[last_names$Romanized.Name==''] <- NA
last_names <- na.omit(last_names$Romanized.Name)

hf_high_impact_conditions <- c('Anxiety disorder', 'Atrial fibrillation', 'Bowel cancer',
                               'Chronic kidney disease', 'Chronic pain',
                               'Chronic obstructive pulmonary disease',
                               'Major depressive disorder', 'Heart failure', 'Lung cancer',
                               'Type 2 diabetes')

medications <- read.csv('source_data/medications.csv', header=TRUE)
medications <- data.frame (
  drug_name = medications$DRUG_DESCRIPTION,
  indication = medications$INDICATION_DESCRIPTION
)
# Change medication names to title case
medications$drug_name <- gsub("(^|[[:space:],-])([[:alpha:]])",
                              "\\1\\U\\2", medications$drug_name,
                                perl = TRUE)
medications$indication[medications$indication=='Anxiety disorder, unspecified'] <- 'Anxiety disorder'
medications$indication[medications$indication=='Anxiety neurosis'] <- 'Anxiety disorder'
medications$indication[medications$indication=='Unspecified atrial fibrillation'] <- 'Atrial fibrillation'
medications$indication[medications$indication=='Malignant neoplasm of colon, unspecified'] <- 'Bowel cancer'
medications$indication[medications$indication=='Malignant neoplasm of ascending colon'] <- 'Bowel cancer'
medications$indication[medications$indication=='Malignant neoplasm of descending colon'] <- 'Bowel cancer'
medications$indication[medications$indication=='Malignant neoplasm of transverse colon'] <- 'Bowel cancer'
medications$indication[medications$indication=='Malignant neoplasm of sigmoid colon'] <- 'Bowel cancer'
medications$indication[medications$indication=='Malignant neoplasm of rectum'] <- 'Bowel cancer'
medications$indication[medications$indication=='Chronic kidney disease, unspecified'] <- 'Chronic kidney disease'
medications$indication[medications$indication=='Chronic kidney disease (CKD)'] <- 'Chronic kidney disease'
medications$indication[medications$indication=='Chronic kidney dis NOS'] <- 'Chronic kidney disease'
medications$indication[medications$indication=='Other chronic pain'] <- 'Chronic pain'
medications$indication[medications$indication=='Chronic obstructive airway disease NOS'] <- 'Chronic obstructive pulmonary disease'
medications$indication[medications$indication=='Unspecified chronic bronchitis'] <- 'Chronic obstructive pulmonary disease'
medications$indication[medications$indication=='Chronic bronchitis NOS'] <- 'Chronic obstructive pulmonary disease'
medications$indication[medications$indication=='Chronic bronchitis'] <- 'Chronic obstructive pulmonary disease'
medications$indication[medications$indication=='Emphysema'] <- 'Chronic obstructive pulmonary disease'
medications$indication[medications$indication=='Emphysema (lung)(pulmonary) NOS'] <- 'Chronic obstructive pulmonary disease'
medications$indication[medications$indication=='Other emphysema'] <- 'Chronic obstructive pulmonary disease'
medications$indication[medications$indication=='Major depressive disorder NOS'] <- 'Major depressive disorder'
medications$indication[medications$indication=='Monopolar Major depressive disorder NOS'] <- 'Major depressive disorder'
medications$indication[medications$indication=='Major depressive disorder, recurrent, unspecified'] <- 'Major depressive disorder'
medications$indication[medications$indication=='Major depressive disorder, recurrent severe without psychotic features'] <- 'Major depressive disorder'
medications$indication[medications$indication=='Heart failure NOS'] <- 'Heart failure'
medications$indication[medications$indication=='Heart failure, unspecified'] <- 'Heart failure'
medications$indication[medications$indication=='Congestive heart failure, unspecified'] <- 'Heart failure'
medications$indication[medications$indication=='Left heart failure'] <- 'Heart failure'
medications$indication[medications$indication=='Lung cancer NOS'] <- 'Lung cancer'
medications$indication[medications$indication=='Malignant neoplasm of bronchus and lung, unspecified'] <- 'Lung cancer'
medications$indication[medications$indication=='Malignant neoplasm of unspecified part of unspecified bronchus or lung'] <- 'Lung cancer'
medications$indication[medications$indication=='Type 2 diabetes mellitus without complications'] <- 'Type 2 diabetes'
medications$indication[medications$indication=='Type 2 diabetes mellitus with other specified complication'] <- 'Type 2 diabetes'
medications$indication[medications$indication=='Type 2 diabetes mellitus'] <- 'Type 2 diabetes'
medications$indication[medications$indication=='Type 2 diabetes mellitus with ketoacidosis without coma'] <- 'Type 2 diabetes'
medications <- medications[medications$indication %in% hf_high_impact_conditions,]
medications <- unique(medications)

uk_postcodes <- read.csv('source_data/uk_postcodes.csv', header=TRUE)
uk_postcodes$postcode[uk_postcodes$postcode==''] <- NA
uk_postcodes$city[uk_postcodes$city==''] <- NA
uk_postcodes$region_name[uk_postcodes$region_name=='East Midlands '] <- 'East Midlands'
uk_postcodes$region_name[uk_postcodes$region_name=='London '] <- 'London'
uk_postcodes$region_name[uk_postcodes$region_name=='North East '] <- 'North East'
uk_postcodes$region_name[uk_postcodes$region_name=='North West '] <- 'North West'
uk_postcodes$region_name[uk_postcodes$region_name=='South East '] <- 'South East'
uk_postcodes$region_name[uk_postcodes$region_name=='South West '] <- 'South West'
uk_postcodes$region_name[uk_postcodes$region_name=='West Midlands '] <- 'West Midlands'
uk_postcodes$region_name[uk_postcodes$region_name=='Yorkshire and the Humber '] <- 'Yorkshire and the Humber'
uk_postcode_ins <- read.csv('source_data/uk_postcode_ins.csv', header=FALSE)
uk_postcode_ins <- uk_postcode_ins$V1
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

year_days <- data.frame(
  month =  c(rep('01', 31), rep('02', 28), rep('03', 31), rep('04', 30),
             rep('05', 31), rep('06', 30), rep('07', 31), rep('08', 31),
             rep('09', 30), rep('10', 31), rep('11', 30), rep('12', 31)),
  day = c(sprintf("%02d", 1:31), sprintf("%02d", 1:28), sprintf("%02d", 1:31),
          sprintf("%02d", 1:30), sprintf("%02d", 1:31), sprintf("%02d", 1:30),
          sprintf("%02d", 1:31), sprintf("%02d", 1:31), sprintf("%02d", 1:30),
          sprintf("%02d", 1:31), sprintf("%02d", 1:30), sprintf("%02d", 1:31))
)
leap_year_days <- data.frame(
  month =  c(rep('01', 31), rep('02', 29), rep('03', 31), rep('04', 30),
             rep('05', 31), rep('06', 30), rep('07', 31), rep('08', 31),
             rep('09', 30), rep('10', 31), rep('11', 30), rep('12', 31)),
  day = c(sprintf("%02d", 1:31), sprintf("%02d", 1:29), sprintf("%02d", 1:31),
          sprintf("%02d", 1:30), sprintf("%02d", 1:31), sprintf("%02d", 1:30),
          sprintf("%02d", 1:31), sprintf("%02d", 1:31), sprintf("%02d", 1:30),
          sprintf("%02d", 1:31), sprintf("%02d", 1:30), sprintf("%02d", 1:31))
)

## Create utility functions for use in data generation -------------------------

rand_add_from_region <- function(region) {
  posts_towns <- data.frame (
    postcode = uk_postcodes$postcode[uk_postcodes$region_name == region],
    town = uk_postcodes$city[uk_postcodes$region_name == region]
  )
  posts_towns <- na.omit(posts_towns)
  num_options <- nrow(posts_towns)
  chosen_option <- sample(1:num_options, 1)
  town <- posts_towns$town[chosen_option]
  postcode_out <- posts_towns$postcode[chosen_option]
  postcode_in <- sample(uk_postcode_ins, 1)
  street <- sample(uk_street_names, 1)
  house_number <- as.character(sample(1:100, 1))
  street_address <- paste(house_number, street, sep = " ")
  town_address <- paste(street_address, town, sep = ", ")
  full_address_str <- paste(town_address, postcode_out, postcode_in, sep = " ")
  full_address_str
}

rand_doc_dob <- function() {
  birth_year <- sample(1950:1999, 1)
  if (birth_year%%4 == 0) {
    birth_year <- as.character(birth_year)
    day_of_year <- sample(1:366, 1)
    birth_month <- leap_year_days$month[day_of_year]
    birth_day <- leap_year_days$day[day_of_year]
  } else {
    birth_year <- as.character(birth_year)
    day_of_year <- sample(1:365, 1)
    birth_month <- year_days$month[day_of_year]
    birth_day <- year_days$day[day_of_year]
  }
  dob_str <- paste(birth_year, birth_month, birth_day, sep = "-")
  dob_str
}

rand_pt_dob <- function() {
  birth_year <- sample(1929:2004, 1)
  if (birth_year%%4 == 0) {
    birth_year <- as.character(birth_year)
    day_of_year <- sample(1:366, 1)
    birth_month <- leap_year_days$month[day_of_year]
    birth_day <- leap_year_days$day[day_of_year]
  } else {
    birth_year <- as.character(birth_year)
    day_of_year <- sample(1:365, 1)
    birth_month <- year_days$month[day_of_year]
    birth_day <- year_days$day[day_of_year]
  }
  dob_str <- paste(birth_year, birth_month, birth_day, sep = "-")
  dob_str
}

rand_blood_result <- function(test_code) {
  if (test_code=='ALB') {
    lab_value <- round(runif(1, 20, 60), digits = 0)
    blood_result <- paste(lab_value, 'g/L', sep = " ")
  } else if (test_code=='ALP') {
    lab_value <- round(runif(1, 20, 150), digits = 0)
    blood_result <- paste(lab_value, 'IU/L', sep = " ")
  } else if (test_code=='BIL') {
    lab_value <- round(runif(1, 0, 30), digits = 0)
    blood_result <- paste(lab_value, 'umol/L', sep = " ")
  } else if (test_code=='CRP') {
    lab_value <- round(runif(1, 0, 10), digits = 1)
    blood_result <- paste(lab_value, 'mg/L', sep = " ")
  } else if (test_code=='CRT') {
    lab_value <- round(runif(1, 30, 150), digits = 0)
    blood_result <- paste(lab_value, 'umol/L', sep = " ")
  } else if (test_code=='GLU') {
    lab_value <- round(runif(1, 0, 20), digits = 1)
    blood_result <- paste(lab_value, 'mmol/L', sep = " ")
  } else if (test_code=='HGB') {
    lab_value <- round(runif(1, 50, 200), digits = 0)
    blood_result <- paste(lab_value, 'g/L', sep = " ")
  } else if (test_code=='HBA') {
    lab_value <- round(runif(1, 20, 100), digits = 0)
    blood_result <- paste(lab_value, 'mmol/mol', sep = " ")
  } else if (test_code=='HDL') {
    lab_value <- round(runif(1, 0.5, 2), digits = 1)
    blood_result <- paste(lab_value, 'mmol/L', sep = " ")
  } else if (test_code=='IRN') {
    lab_value <- round(runif(1, 5, 40), digits = 0)
    blood_result <- paste(lab_value, 'umol/L', sep = " ")
  } else if (test_code=='LAC') {
    lab_value <- round(runif(1, 0.5, 10), digits = 1)
    blood_result <- paste(lab_value, 'mmol/L', sep = " ")
  } else if (test_code=='LDL') {
    lab_value <- round(runif(1, 0, 5), digits = 1)
    blood_result <- paste(lab_value, 'mmol/L', sep = " ")
  } else if (test_code=='LYM') {
    lab_value <- round(runif(1, 0, 10), digits = 1)
    blood_result <- paste(lab_value, 'x 10^9/L', sep = " ")
  } else if (test_code=='MAG') {
    lab_value <- round(runif(1, 0.5, 1.5), digits = 1)
    blood_result <- paste(lab_value, 'mmol/L', sep = " ")
  } else if (test_code=='NEU') {
    lab_value <- round(runif(1, 1, 10), digits = 1)
    blood_result <- paste(lab_value, 'x 10^9/L', sep = " ")
  } else if (test_code=='POT') {
    lab_value <- round(runif(1, 1, 10), digits = 1)
    blood_result <- paste(lab_value, 'mmol/L', sep = " ")
  } else if (test_code=='RBC') {
    lab_value <- round(runif(1, 2, 8), digits = 1)
    blood_result <- paste(lab_value, 'x 10^12/L', sep = " ")
  } else if (test_code=='TRI') {
    lab_value <- round(runif(1, 0, 5), digits = 1)
    blood_result <- paste(lab_value, 'mmol/L', sep = " ")
  } else if (test_code=='URE') {
    lab_value <- round(runif(1, 1, 10), digits = 1)
    blood_result <- paste(lab_value, 'mmol/L', sep = " ")
  } else if (test_code=='WBC') {
    lab_value <- round(runif(1, 0, 20), digits = 1)
    blood_result <- paste(lab_value, 'x 10^9/L', sep = " ")
  } else {
    blood_result <- 'Specimen rejected'
  }
  blood_result
}

## Create hospitals table ------------------------------------------------------

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

# Change hospital names to title case
hospitals_table$hosp_name <- gsub("(^|[[:space:],-])([[:alpha:]])",
                                 "\\1\\U\\2", hospitals_table$hosp_name,
                                 perl = TRUE)
hospitals_table$hosp_name <- gsub("Of", "of", hospitals_table$hosp_name)
# Change hospital addresses to title case
hospitals_table$address <- gsub("(^|[[:space:],-])([[:alpha:]])",
                               "\\1\\U\\2", hospitals_table$address,
                               perl = TRUE)
hospitals_table$address <- gsub("Under", "under", hospitals_table$address)

hosp_to_export <- subset(
  hospitals_table,
  select = c(hosp_id,
             hosp_name,
             address,
             num_beds,
             type,
             emergency_services,
             year_of_accred)
)

write.csv(hosp_to_export, file = 'hospitals_table.csv',
          row.names = FALSE)

write.table(
  hosp_to_export,
  file='hospitals_table.txt',
  quote=FALSE,
  sep='\t',
  row.names = FALSE,
  col.names = c('hospital_id',
                'hospital_name',
                'hospital_address',
                'no_of_beds',
                'hospital_type',
                'emergency_services',
                'accreditation_year')
)

# Create diseases table

diseases_table <- data.frame(
  dis_id = seq(1,10),
  dis_name = hf_high_impact_conditions
)

write.csv(diseases_table, file = 'diseases_table.csv',
          row.names = FALSE)
          
write.table(
    diseases_table,
    file='diseases_table.txt',
    quote=FALSE,
    sep='\t',
    row.names = FALSE,
    col.names = c('disease_id',
                  'disease_name')
)

## Create doctors table --------------------------------------------------------

doctors_table <- data.frame(
  doc_id = seq(1,100),
  doc_name = rep(NA,100),
  doc_dob = rep(NA,100),
  doc_address = rep(NA,100),
  hosp_id = rep(NA,100),
  dis_id = rep(NA,100)
)

doctors_table$doc_name <- paste(rep('Dr.', 100),
                                sample(first_names, 100, replace=TRUE),
                                sample(last_names, 100, replace=TRUE),
                                sep = " ")

possible_hospitals <- hospitals_table$hosp_id[!(hospitals_table$type == 'Specialist')]

for (doc in 1:100) {
  base_hosp_id <- sample(possible_hospitals, 1)
  region_ <- hospitals_table$region_[hospitals_table$hosp_id==base_hosp_id]
  doctors_table$doc_dob[doc] <- rand_doc_dob()
  doctors_table$doc_address[doc] <- rand_add_from_region(region_)
  doctors_table$hosp_id[doc] <- base_hosp_id
  doctors_table$dis_id[doc] <- sample(diseases_table$dis_id, 1)
}

write.csv(doctors_table, file = 'doctors_table.csv',
          row.names = FALSE)

write.table(
    doctors_table,
    file='doctors_table.txt',
    quote=FALSE,
    sep='\t',
    row.names = FALSE,
    col.names = c('doctor_id',
                  'doctor_name',
                  'doctor_dob',
                  'doctor_address',
                  'hospital_id',
                  'disease_id')
)

## Create patients table -------------------------------------------------------

patients_table <- data.frame(
  pt_id = seq(1,600),
  pt_name = rep(NA,600),
  pt_dob = rep(NA,600),
  pt_address = rep(NA,600),
  doc_id = rep(NA, 600)
)

patients_table$pt_name <- paste(sample(first_names, 600, replace=TRUE),
                                sample(last_names, 600, replace=TRUE),
                                sep = " ")

for (pt in 1:600) {
  reg_doc_id <- sample(doctors_table$doc_id, 1)
  region_ <- hospitals_table$region_[hospitals_table$hosp_id==doctors_table$hosp_id[doctors_table$doc_id==reg_doc_id]]
  patients_table$pt_dob[pt] <- rand_pt_dob()
  patients_table$pt_address[pt] <- rand_add_from_region(region_)
  patients_table$doc_id[pt] <- reg_doc_id
}

write.table(
    patients_table,
    file='patients_table.txt',
    quote=FALSE,
    sep='\t',
    row.names = FALSE,
    col.names = c('patient_id',
                  'patient_name',
                  'patient_dob',
                  'patient_address',
                  'doctor_id')
)

write.csv(patients_table, file = 'patients_table.csv',
          row.names = FALSE)


## Create medications table ----------------------------------------------------

medication_indication_counts <- table(medications[,1])
medications_w_one_ind_listed <- names(medication_indication_counts[medication_indication_counts == 1])
medications_indications <- medications[medications[,1] %in% medications_w_one_ind_listed, ]
num_medications <- nrow(medications_indications)

medications_table <- data.frame(
  medication_id = seq(1,num_medications),
  medication_name = medications_indications$drug_name,
  disease_id =match(medications_indications$indication,
                    hf_high_impact_conditions)
)

write.csv(medications_table, file = 'medications_table.csv',
          row.names = FALSE)

write.table(
    medications_table,
    file='medications_table.txt',
    quote=FALSE,
    sep='\t',
    row.names = FALSE,
    col.names = c('medication_id',
                  'medication_name',
                  'disease_id')
)

## Create prescriptions table --------------------------------------------------

prescriptions_table <- data.frame(
  prs_id = seq(1,500),
  prs_date = rep(NA,500),
  medication_id = rep(NA, 500),
  patient_id = rep(NA, 500),
  doc_id = rep(NA, 500)
)

for (i in 1:500) {
  pt_id <- sample(patients_table$pt_id, 1)
  reg_doc_id <- patients_table$doc_id[pt_id]
  region_ <- hospitals_table$region_[hospitals_table$hosp_id==doctors_table$hosp_id[doctors_table$doc_id==reg_doc_id]]
  local_docs <- doctors_table$doc_id[doctors_table$hosp_id %in% hospitals_table$hosp_id[hospitals_table$region_==region_]]
  prescriber <- sample(local_docs, 1)
  drug <- sample(medications_table$medication_id)
  prs_year <- sample(2024:2025, 1)
  if (prs_year == 2024) {
    prs_day_of_year <- sample(1:366, 1)
    prs_month <- leap_year_days$month[prs_day_of_year]
    prs_day <- leap_year_days$day[prs_day_of_year]
  } else {
    prs_day_of_year <- sample(1:333, 1)
    prs_month <- year_days$month[prs_day_of_year]
    prs_day <- year_days$day[prs_day_of_year]
  }
  prescriptions_table$prs_date[i] <- paste(prs_year,
                                           prs_month,
                                           prs_day,
                                           sep = "-")
  prescriptions_table$medication_id[i] <- sample(medications_table$medication_id, 1)
  prescriptions_table$patient_id[i] <- pt_id
  prescriptions_table$doc_id[i] <- prescriber
}

write.csv(prescriptions_table, file = 'prescriptions_table.csv',
          row.names = FALSE)
          
write.table(
    prescriptions_table,
    file='prescriptions_table.txt',
    quote=FALSE,
    sep='\t',
    row.names = FALSE,
    col.names = c('prescription_id',
                  'prescription_date',
                  'medication_id',
                  'patient_id',
                  'doctor_id')
)

## Create appointments table ---------------------------------------------------

appointments_table <- data.frame(
  apt_id = seq(1,500),
  apt_date = rep(NA,500),
  patient_id = rep(NA, 500),
  doc_id = rep(NA, 500)
)

for (i in 1:500) {
  pt_id <- sample(patients_table$pt_id, 1)
  reg_doc_id <- patients_table$doc_id[pt_id]
  region_ <- hospitals_table$region_[hospitals_table$hosp_id==doctors_table$hosp_id[doctors_table$doc_id==reg_doc_id]]
  local_docs <- doctors_table$doc_id[doctors_table$hosp_id %in% hospitals_table$hosp_id[hospitals_table$region_==region_]]
  apt_doc <- sample(local_docs, 1)
  drug <- sample(medications_table$medication_id)
  apt_year <- sample(2026:2027, 1)
  apt_day_of_year <- sample(1:365, 1)
  apt_month <- leap_year_days$month[prs_day_of_year]
  apt_day <- leap_year_days$day[prs_day_of_year]
  appointments_table$apt_date[i] <- paste(apt_year,
                                          apt_month,
                                          apt_day,
                                          sep = "-")
  appointments_table$patient_id[i] <- pt_id
  appointments_table$doc_id[i] <- apt_doc
}
 
write.csv(appointments_table, file = 'appointments_table.csv',
          row.names = FALSE)
          
write.table(appointments_table,
            file='appointments_table.txt',
            quote=FALSE,
            sep='\t',
            row.names = FALSE,
            col.names = c('appointment_id',
                          'appointment_date',
                          'patient_id',
                          'doctor_id')
)

## Create lab results table ----------------------------------------------------

lab_results_table <- data.frame(
  lab_result_id = seq(1,500),
  test_date = rep(NA,500),
  test_type = rep(NA, 500),
  test_result = rep(NA, 500),
  patient_id = rep(NA, 500),
  doc_id = rep(NA, 500)
)

for (i in 1:500) {
  pt_id <- sample(patients_table$pt_id, 1)
  reg_doc_id <- patients_table$doc_id[pt_id]
  region_ <- hospitals_table$region_[hospitals_table$hosp_id==doctors_table$hosp_id[doctors_table$doc_id==reg_doc_id]]
  local_docs <- doctors_table$doc_id[doctors_table$hosp_id %in% hospitals_table$hosp_id[hospitals_table$region_==region_]]
  requester <- sample(local_docs, 1)
  test_code <- blood_tests$test_code[sample(1:nrow(blood_tests), 1)]
  result_of_test <- rand_blood_result(test_code)
  test_year <- sample(2024:2025, 1)
  if (test_year == 2024) {
    test_day_of_year <- sample(1:366, 1)
    test_month <- leap_year_days$month[test_day_of_year]
    test_day <- leap_year_days$day[test_day_of_year]
  } else {
    test_day_of_year <- sample(1:333, 1)
    test_month <- year_days$month[test_day_of_year]
    test_day <- year_days$day[test_day_of_year]
  }
  lab_results_table$test_date[i] <- paste(test_year,
                                          test_month,
                                          test_day,
                                          sep = "-")
  lab_results_table$test_type[i] <- blood_tests$test_name[blood_tests$test_code==test_code]
  lab_results_table$test_result[i] <- result_of_test
  lab_results_table$patient_id[i] <- pt_id
  lab_results_table$doc_id[i] <- requester
}

write.csv(lab_results_table, file = 'lab_results_table.csv',
          row.names = FALSE)
          
write.table(
    lab_results_table,
    file='lab_results_table.txt',
    quote=FALSE, sep='\t',
    row.names = FALSE,
    col.names = c('lab_result_id',
                  'test_date',
                  'test_type',
                  'test_result',
                  'patient_id',
                  'doctor_id')
)

## Clear global environment ----------------------------------------------------
                          
rm(list = ls())