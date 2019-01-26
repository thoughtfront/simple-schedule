require 'rails_helper'

RSpec.describe Core::Event, type: :model do

  context 'associations' do
    it {is_expected.to belong_to(:location)}
    it {is_expected.to belong_to(:event_category)}
  end

  context '.save' do
    it 'succeeds' do
      test_event = build(:core_event)
      expect(test_event.save).to be(true)
    end
  end
  
  context 'validations' do
    it 'requires a title' do
      test_event = build(:core_event, title: nil)
      expect(test_event.valid?).to be(false)
    end
  end
  
end
