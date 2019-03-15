# == Schema Information
#
# Table name: core_users
#
#  id                 :uuid             not null, primary key
#  email              :string           not null
#  encrypted_password :string(128)      not null
#  confirmation_token :string(128)
#  remember_token     :string(128)      not null
#  locked_at          :datetime
#  last_sign_in_ip    :inet
#  last_sign_in_at    :datetime
#  contact_id         :uuid
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

FactoryBot.define do
  factory 'core/user', class: 'Core::User' do
    email {create(:core_email).value}
    password {'test123'}
    confirmation_token {'test123'}
    contact {create(:core_contact)}
  end
end
