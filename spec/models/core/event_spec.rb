require 'rails_helper'

RSpec.describe Core::Event, type: :model do
  context '.save' do
    it 'succeeds' do
      test_event = build(:core_event)
      expect(test_event.save).to be_truthy
    end
  end
  
  context 'validations' do
    it 'requires a title' do
      test_event = build(:core_event, title: nil)
      expect(test_event.valid?).to be_falsy
    end
  end
end
