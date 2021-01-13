require 'rails_helper'

RSpec.describe Room, type: :model do

    describe 'validations' do
        it { should validate_presence_of(:number) }
        it { should validate_uniqueness_of(:number) }
    end

    describe 'associations' do
        it { should have_many(:meetings) }
    end
end