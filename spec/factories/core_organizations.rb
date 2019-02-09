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

FactoryBot.define do
  factory :core_organization, class: 'Core::Organization' do

    name { "organization#{Core::Organization.count}" }
    status { 'active' }

    after(:build) do |organization|
      organization.primary_email = create(:core_email)
    end

    factory :core_organization_no_email do
      after(:build) do |organization|
        organization.primary_email = nil
      end
    end

  end
end
