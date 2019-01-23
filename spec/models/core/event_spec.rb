require 'rails_helper'

RSpec.describe Core::Event, type: :model do

  context 'associations' do
    it {is_expected.to belong_to(:location)}
  end

  context '.save' do
    it 'succeeds' do
      test_event = build(:core_event)
      expect(test_event.save).to be_truthy
    end
  end
  
  context 'validations' do
    it 'requires a title' do
      test_event = build(:core_event, title: nil)
      expect(test_event.valid?).to be(false)
    end
  end
  
end
