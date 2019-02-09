# == Schema Information
#
# Table name: core_phones
#
#  id         :uuid             not null, primary key
#  value      :string
#  label      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Core::Phone, type: :model do

  context 'associations' do
    # it {is_expected.to have_one(:organization)}
    it {is_expected.to have_and_belong_to_many(:contacts)}
  end

  context 'validations' do
    it 'requires a value' do
      test_phone = build(:core_phone, value: nil)
      expect(test_phone.valid?).to be(false)
    end
  end
end
