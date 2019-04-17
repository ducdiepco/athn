class CreateMedications < ActiveRecord::Migration[5.2]
  def change
    create_table :medications do |t|
      t.string :medication_name
      t.string :manufacturer

      t.timestamps
    end
  end
end
