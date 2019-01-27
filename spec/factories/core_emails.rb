FactoryBot.define do
  factory :core_email, class: 'Core::Email' do

    value {'test-value@email.com'}
    
  end
end
