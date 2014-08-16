class RemoveAttendeeFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :attendee
  end
end
