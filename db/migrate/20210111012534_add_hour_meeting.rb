class AddHourMeeting < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :hour_start, :integer
  end
end
