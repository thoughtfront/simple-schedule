# == Schema Information
#
# Table name: core_event_categories
#
#  id          :uuid             not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Core::EventCategory, type: :model do

    context 'associations' do
        it {is_expected.to have_many(:events)}
    end

    context 'validations' do
        it 'requires a name' do
            test_event_category = build(:core_event_category, name: nil)
            expect(test_event_category.valid?).to be(false)
        end
    end
    
end
