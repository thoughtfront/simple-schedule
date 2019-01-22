require 'rails_helper'

RSpec.describe Core::Location, type: :model do
  # context 'associations' do
  #   it {is_expected.to belong_to(:core_event)}
  # end
  context '.save' do
    it 'succeeds' do
    test_location = build(:core_location)
    expect(test_location.save).to be_truthy
    end
  end

  context 'validations' do
    it 'requires a name' do
      test_location = build(:core_location, name: nil)
      expect(test_location.valid?).to be_falsey
    end
  end
end
