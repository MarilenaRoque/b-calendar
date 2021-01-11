class Meeting < ApplicationRecord
    belongs_to :user
    belongs_to :room
    validates :hour_start, presence: true
end
