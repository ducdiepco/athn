# ATHN

## Getting Started

- Seed CSV data

```ruby
rake 'import_csv:run[data/diagnosis.csv, Diagnosis]'
rake 'import_csv:run[data/patient.csv, Patient]'
rake 'import_csv:run[data/provider.csv, Provider]'
rake 'import_csv:run[data/medication.csv, Medication]'
rake 'import_csv:run[data/treatment.csv, Treatment]'
rake 'import_csv:run[data/visit.csv, Visit]'
rake 'import_csv:run[data/patient_dianosis.csv, PatientDiagnosis]'
```
