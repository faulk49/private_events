class AddUsersToAttendees < ActiveRecord::Migration
  def change
    add_column :attendees, :users, :string
  end
end
