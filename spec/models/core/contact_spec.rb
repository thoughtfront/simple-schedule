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

require 'rails_helper'

RSpec.describe Core::Contact, type: :model do

    context 'associations' do
      it {is_expected.to have_one(:user)}
      it {is_expected.to have_and_belong_to_many(:addresses)}
      it {is_expected.to have_and_belong_to_many(:phones)}
      # it {is_expected.to have_many(:emails)}
      # it {is_expected.to belong_to(:organization)}
      it {is_expected.to belong_to(:primary_email).class_name(Core::Email.name)}
      it {is_expected.to belong_to(:primary_phone).class_name(Core::Phone.name)}
      it {is_expected.to belong_to(:primary_address).class_name(Core::Address.name)}
    end

    context 'validations' do
      it 'is not valid without first_name' do
        contact = build(:core_contact, first_name: nil)
        expect(contact.valid?).to be(false);
      end

      it 'is not valid without last_name' do
        contact = build(:core_contact, last_name: nil)
        expect(contact.valid?).to be(false);
      end

      # it 'is not valid without primary_email' do
      #   contact = build(:core_contact, primary_email: nil)
      #   expect(contact.valid?).to be(false);
      # end

      # it 'is not valid if user email is not primary email' do
      #   contact = create(:core_contact)
      #   user = create(:core_user, contact: contact, email: "wrong@tf.com")
      #   expect(contact.valid?).to be(false);
      # end
    end

end
