class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :first_name
      t.string :last_name
      t.string :office_address
      t.string :office_city
      t.string :office_state

      t.timestamps
    end
  end
end
