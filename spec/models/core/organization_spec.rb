# == Schema Information
#
# Table name: core_organizations
#
#  id                 :uuid             not null, primary key
#  name               :string           not null
#  description        :text
#  primary_contact_id :uuid
#  primary_email_id   :uuid             not null
#  primary_address_id :uuid
#  primary_phone_id   :uuid
#  status             :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'rails_helper'

RSpec.describe Core::Organization, type: :model do

  it {is_expected.to have_many(:contacts)}
  it {is_expected.to belong_to(:primary_contact).class_name(Core::Contact.name)}
  it {is_expected.to belong_to(:primary_email).class_name(Core::Email.name)}
  it {is_expected.to belong_to(:primary_address).class_name(Core::Address.name)}
  it {is_expected.to belong_to(:primary_phone).class_name(Core::Phone.name)}

  context 'validations' do
    it 'is not valid without name' do
      organization = build(:core_organization, name: nil)
      expect(organization.valid?).to be(false)
    end

    it 'is not valid without primary_email_id' do
      organization = build(:core_organization_no_email)
      expect(organization.valid?).to be(false)
    end

    it 'is not valid without statis' do
      organization = build(:core_organization, status: nil)
      expect(organization.valid?).to be(false)
    end
  end

end
