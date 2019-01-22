FactoryBot.define do
  factory :core_location, class: 'Core::Location' do
    address_id { 1 }
    name { "MyString" }
  end
end
