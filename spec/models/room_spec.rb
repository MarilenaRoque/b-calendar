require 'rails_helper'

RSpec.describe Room, type: :model do
  # Testing Room creation
  let(:subject) do
    described_class.new(
      number: 204
    )
  end

  it 'Validation of attributes' do
    expect(subject).to be_valid
  end

  it 'Should not be valid without number attribute' do
    subject.number = nil
    expect(subject).to_not be_valid
  end

  # Testing Room Model validations

  describe 'validations' do
    it { should validate_presence_of(:number) }
    it { should validate_uniqueness_of(:number) }
  end

  # Testing Room Model associations

  describe 'associations' do
    it { should have_many(:meetings) }
  end
end
