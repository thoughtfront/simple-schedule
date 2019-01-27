FactoryBot.define do
    factory :core_contact, class: 'Core::Contact' do

        first_name { 'Samuel' }
        last_name { 'Adams' }
        # organization { create(:core_organization) }
        # primary_email { create(:core_email) }

    end
end