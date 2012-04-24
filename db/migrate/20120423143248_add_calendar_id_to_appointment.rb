class AddCalendarIdToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :calendar_id, :integer
  end
end
