require 'rails_helper'

RSpec.describe Event, type: :model do
  context '.save' do
    it 'succeeds' do
      event = build(:event)
      expect(menu.save).to be_truthy
    end
  end
end
