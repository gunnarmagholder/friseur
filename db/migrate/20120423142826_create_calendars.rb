class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.references :employee
      t.date :day

      t.timestamps
    end
    add_index :calendars, :employee_id
  end
end
