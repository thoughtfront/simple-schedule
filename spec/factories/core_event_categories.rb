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

FactoryBot.define do
    factory :core_event_category, class: 'Core::EventCategory' do
        
        name {'test-name'}
        description {'test description'}

    end
end
