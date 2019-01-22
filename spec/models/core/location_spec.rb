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
end
