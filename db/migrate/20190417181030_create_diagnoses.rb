class CreateDiagnoses < ActiveRecord::Migration[5.2]
  def change
    create_table :diagnoses do |t|
      t.string :diagnosis
      t.string :diagnosis_code

      t.timestamps
    end
  end
end
