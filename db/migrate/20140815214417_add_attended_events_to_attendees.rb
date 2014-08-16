class AddAttendedEventsToAttendees < ActiveRecord::Migration
  def change
    add_column :attendees, :attended_events, :string
  end
end
