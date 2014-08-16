class RemoveAttendedEventFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :attended_event
  end
end
