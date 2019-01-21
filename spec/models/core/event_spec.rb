require 'rails_helper'

RSpec.describe Core::Event, type: :model do
  context '.save' do
    it 'succeeds' do
      event = build(:core_event)
      expect(event.save).to be_truthy
    end
  end
end
