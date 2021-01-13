class Room < ApplicationRecord
    has_many :meetings, dependent: :destroy
    validates :number, presence: true
end
