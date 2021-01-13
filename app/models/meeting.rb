class Meeting < ApplicationRecord
    belongs_to :user
    belongs_to :room
    validates :title, presence: true
    validates_presence_of(:room_id)
    validates_presence_of(:start_time)
    validates :start_time, uniqueness: { scope: :room_id}
end
