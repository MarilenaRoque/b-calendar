require 'rails_helper'

RSpec.describe User, type: :model do
  # Creating a subject to test user

  let(:subject) do
    described_class.new(
      email: 'testx@mail.com',
      created_at: '2020-09-21 22:35:32',
      updated_at: '2020-09-21 22:35:32',
      username: 'testx',
      password: '123456',
      password_confirmation: '123456'
    )
  end

  # Testing user creation

  describe 'Validation with Subject' do
    it 'Validation of attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.username = ''
      expect(subject).to_not be_valid
    end

    it "is not valid if password and confirmation doesn't match" do
      subject.password = '123456'
      subject.password_confirmation = '654321'
      expect(subject).to_not be_valid
    end

    it 'is valid with a valid email' do
      subject.email = 'valid@mail.com'
      expect(subject).to be_valid
    end

    it 'is not valid without email' do
      subject.email = ''
      expect(subject).to_not be_valid
    end
  end

  # Testing Model validations

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:username) }
  end

  # Testing User Model associations

  describe 'associations' do
    it { should have_many(:meetings) }
  end
end
