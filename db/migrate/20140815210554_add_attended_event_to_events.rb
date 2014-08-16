class AddAttendedEventToEvents < ActiveRecord::Migration
  def change
    add_column :events, :attended_event, :string
  end
end
