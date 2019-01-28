# == Schema Information
#
# Table name: core_emails
#
#  id         :uuid             not null, primary key
#  value      :string           not null
#  label      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Core::Email, type: :model do

  context 'associations' do
    # it {is_expected.to have_one(:user)}
    # it {is_expected.to have_one(:organization)}
  end

  context 'validations' do
    it 'requires a value' do
      test_email = build(:core_email, value:nil)
      expect(test_email.valid?).to be(false)
    end
  end

end
