# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Patient.destroy_all
Doctor.destroy_all
Appointment.destroy_all
City.destroy_all
Specialty.destroy_all

specialties = ["pediatre", "dentiste", "généraliste", "kinesitherapeutes", "osteopathe", "dermatologue", "neurologue", "cardiologue", "psychatre"
               "radiologue", "stomatologue"]

25.times do
	city = City.create(name: Faker::Address.city)
	d = Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Address.zip, city: city)
	p = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: city)
  a = Appointment.create(doctor: d, patient: p, city: city, date: Faker::Date.in_date_period)
  s = Specialty.create(name: specialties[rand(0..(specialties.length))])
  s2 = Specialty.create(name: specialties[rand(0..(specialties.length))])
  d.specialties << s
  d.specialties << s2
end