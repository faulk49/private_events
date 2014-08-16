class AddAttendedEventIdToAttendances < ActiveRecord::Migration
  def change
    add_column :attendances, :attended_event_id, :integer
  end
end
