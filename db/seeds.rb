# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)/

email1 = Core::Email.create({
  value: 'test@tf.com',
})
email2 = Core::Email.create({
  value: 'test2@tf.com',
})

phone1 = Core::Phone.create({
  value: '815-123-4567',
})
phone2 = Core::Phone.create({
  value: '815-999-8888',
})

address1 = Core::Address.create({
  address_one: "123 Main St",
  city: "DeKalb",
  state_region: "Illinois",
  country: "United States",
  postal_code: "60115"
})

address2 = Core::Address.create({
  address_one: "987 Home Ave.",
  city: "DeKalb",
  state_region: "Illinois",
  country: "United States",
  postal_code: "60115"
})

address3 = Core::Address.create({
  address_one: "456 Home Ave.",
  city: "DeKalb",
  state_region: "Illinois",
  country: "United States",
  postal_code: "60115"
})

org = Core::Organization.create({
  name: "ThoughtFront, Inc.",
  primary_email_id: email1.id,
  status: 'active',
})

contact = Core::Contact.create({
  first_name: 'Samuel',
  last_name: 'Adams',
  organization_id: org.id,
  primary_email_id: email1.id
})

# location1 = Core::Location.create({
#   address_id: address1.id,
#   name: "test_name1",
#   description: "test_description1"
# })

# location2 = Core::Location.create({
#   address_id: address2.id,
#   name: "test_name2",
#   description: "test_description2"
# })

# location3 = Core::Location.create({
#   address_id: address3.id,
#   name: "test_name3",
#   description: "test_description3"
# })


contact.addresses << address1
contact.addresses << address2
contact.emails << email1
contact.emails << email2

Core::User.create({
  email: email1.value,
  password: 'test123',
  confirmation_token: 'test123',
  contact_id: contact.id
})

org.primary_contact = contact
org.save