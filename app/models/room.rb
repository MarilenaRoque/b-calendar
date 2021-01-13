class Room < ApplicationRecord
    has_many :meetings, dependent: :destroy
    validates :number, presence: true
    validates_uniqueness_of :number
end
