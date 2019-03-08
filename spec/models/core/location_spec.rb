# == Schema Information
#
# Table name: core_locations
#
#  id          :uuid             not null, primary key
#  address_id  :uuid
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Core::Location, type: :model do

  context 'associations' do
    it {is_expected.to have_many(:events)}
    it {is_expected.to belong_to(:address)}
  end

  context '.save' do
    it 'succeeds' do
      test_location = build(:location)
      expect(test_location.save).to be(true)
    end
  end

  context 'validations' do
    it 'requires a name' do
      test_location = build(:location, name: nil)
      expect(test_location.valid?).to be(false)
    end
  end
end
