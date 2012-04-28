class RemoveEmployeeFromAppointment < ActiveRecord::Migration
  def up
    remove_column :appointments, :employee
  end

  def down
    add_column :appointments, :employee, :references
  end
end
