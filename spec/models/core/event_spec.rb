# == Schema Information
#
# Table name: core_events
#
#  id                :uuid             not null, primary key
#  location_id       :uuid
#  event_category_id :uuid
#  title             :string
#  description       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe Core::Event, type: :model do

  context 'associations' do
    it {is_expected.to belong_to(:location)}
    it {is_expected.to belong_to(:event_category)}
  end

  context '.save' do
    it 'succeeds' do
      test_event = build(:event_with_event_category)
      expect(test_event.save).to be(true)
    end
  end
  
  context 'validations' do
    it 'requires a title' do
      test_event = build(:event, title: nil)
      expect(test_event.valid?).to be(false)
    end
  end
end
