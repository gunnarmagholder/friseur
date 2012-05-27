class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :app_date
      t.time :app_time
      t.integer :customer_id
      t.references :employee
      t.references :product
      t.text :notes
      t.boolean :confirmed
      t.string :telephone
      t.string :email
      t.string :custname

      t.timestamps
    end
    add_index :appointments, :employee_id
    add_index :appointments, :app_date
  end
end
