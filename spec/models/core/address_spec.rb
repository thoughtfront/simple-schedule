# == Schema Information
#
# Table name: core_addresses
#
#  id           :uuid             not null, primary key
#  address_one  :string           not null
#  address_two  :string
#  city         :string           not null
#  state_region :string           not null
#  country      :string           not null
#  postal_code  :string           not null
#  label        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Core::Address, type: :model do
  context 'association' do
    it {is_expected.to have_many(:locations)}
    # it {is_expected.to have_many(:contacts)}
  end

  context 'validations' do
    it 'is not valid without address_one' do
      address = build(:core_address, address_one: nil)
      expect(address.valid?).to be(false)
    end

    it 'is not valid without city' do
      address = build(:core_address, city: nil)
      expect(address.valid?).to be(false)
    end

    it 'is not valid without state_region' do
      address = build(:core_address, state_region: nil)
      expect(address.valid?).to be(false)
    end

    it 'is not valid without country' do
      address = build(:core_address, country: nil)
      expect(address.valid?).to be(false)
    end

    it 'is not valid without postal_code' do
      address = build(:core_address, postal_code: nil)
      expect(address.valid?).to be(false)
    end
  end
end
