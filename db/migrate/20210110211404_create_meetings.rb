class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.integer :user_id
      t.integer :room_id
      t.string :title
      t.string :description
      t.datetime :start_time

      t.timestamps
    end
  end
end
