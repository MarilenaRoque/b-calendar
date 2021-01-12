class Room < ApplicationRecord
    has_many :meetings
    validates :number, presence: true
end
