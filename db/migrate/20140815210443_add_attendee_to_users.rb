class AddAttendeeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :attendee, :string
  end
end
