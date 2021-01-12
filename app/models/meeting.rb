class Meeting < ApplicationRecord
    belongs_to :user
    belongs_to :room
    validates :title, presence: true
    validates :start_time, uniqueness: { scope: :room_id}
end
