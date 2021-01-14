require 'rails_helper'

RSpec.describe Meeting, type: :model do
    let(:user) do
        User.create(
          email: 'testing@mail.com',
          created_at: '2020-09-21 22:35:32',
          updated_at: '2020-09-21 22:35:32',
          username: 'testing',
          password: '123456',
          password_confirmation: '123456'
        )
    end
    let(:room) do
        Room.create(
            number: 999,
        )
    end

    let(:subject) do
        Meeting.create(
            room_id: room.id,
            user_id: user.id,
            start_time: "2020-12-28 08:00:00",
            title: 'validate',
            description: 'description',
        )
    end
  
    it 'it is valid with the right attributes' do
        expect(subject).to be_valid
    end

    it 'it is invalid with empty title' do
        subject.title = ""
        expect(subject).to_not be_valid
    end

    it 'it is invalid without a valid room id' do
        subject.room_id = -50
        expect(subject).to_not be_valid
    end

    it 'it is invalid without a valid user id' do
        subject.user_id = -50
        expect(subject).to_not be_valid
    end

    it 'it is invalid without start time' do
        subject.start_time = nil
        expect(subject).to_not be_valid
    end
        


    # Testing Meeting Validation

    describe 'validations' do
        it { should validate_presence_of(:title) }
        it { should validate_presence_of(:room_id) }
        it { should validate_presence_of(:start_time) }
        it { should validate_uniqueness_of(:start_time).scoped_to(:room_id) }
    end

    # Testing Meeting Associations

    describe 'associations' do
        it { should belong_to(:room) }
        it { should belong_to(:user) }
    end
end