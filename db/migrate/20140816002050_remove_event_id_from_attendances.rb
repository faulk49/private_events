class RemoveEventIdFromAttendances < ActiveRecord::Migration
  def change
    remove_column :attendances, :event_id
  end
end
