class CreateTreatments < ActiveRecord::Migration[5.2]
  def change
    create_table :treatments do |t|
      t.references :medication, index: true, foreign_key: { to_table: :medications }
      t.string :dosage
      t.datetime :start_date
      t.datetime :end_date
      t.references :patient, index: true, foreign_key: { to_table: :patients }
    end
  end
end
