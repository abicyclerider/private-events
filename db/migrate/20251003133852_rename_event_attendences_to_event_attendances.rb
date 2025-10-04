class RenameEventAttendencesToEventAttendances < ActiveRecord::Migration[8.0]
  def change
    rename_table :event_attendences, :event_attendances 
  end
end
