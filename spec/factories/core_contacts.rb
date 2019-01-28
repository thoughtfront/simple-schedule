# == Schema Information
#
# Table name: core_contacts
#
#  id                 :uuid             not null, primary key
#  prefix             :string
#  first_name         :string           not null
#  middle_name        :string
#  last_name          :string           not null
#  suffix             :string
#  gender             :string
#  birth_date         :date
#  organization_id    :uuid             not null
#  primary_email_id   :uuid             not null
#  primary_phone_id   :uuid
#  primary_address_id :uuid
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

FactoryBot.define do
    factory :core_contact, class: 'Core::Contact' do

        first_name { 'Samuel' }
        last_name { 'Adams' }
        # organization { create(:core_organization) }
        # primary_email { create(:core_email) }

    end
end
