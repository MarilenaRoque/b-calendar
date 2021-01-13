require 'rails_helper'

RSpec.describe Meeting, type: :model do

    describe 'validations' do
        it { should validate_presence_of(:title) }
        it { should validate_presence_of(:room_id) }
        it { should validate_presence_of(:start_time) }
        it { should validate_uniqueness_of(:start_time).scoped_to(:room_id) }
    end

    describe 'associations' do
        it { should belong_to(:room) }
        it { should belong_to(:user) }
    end
end