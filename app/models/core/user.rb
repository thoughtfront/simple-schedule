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

class Core::User < ApplicationRecord
  include Clearance::User
  
  belongs_to :contact

end
