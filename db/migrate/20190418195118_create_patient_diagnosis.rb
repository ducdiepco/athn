class CreatePatientDiagnosis < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_diagnoses do |t|
      t.references :diagnosis, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.references :diagnosing_provider, foreign_key: { to_table: :providers }
      t.references :patient, foreign_key: true
    end
  end
end
