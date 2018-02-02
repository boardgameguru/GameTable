# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Users

User.create(first_name: 'Jane', last_name: 'Doe', email: 'janedoe@gmail.com', password: 'password')

User.create(first_name: 'John', last_name: 'Doe', email: 'johndoe@gmail.com', password: 'password')

User.create(first_name: 'Thomas', last_name: 'Spencer', email: 'thomas.spencer416@gmail.com', password: 'abcd1234')

# Create Host

Host.create(name: 'Store1', address: '123 Street', phone: '1234567890', email: 'store1@store.com', password: 'storepassword')

# Create Tables

Table.create(host_id: 1, table_name: 'Event1', table_date: '2018-02-07', table_time: '2000-01-01 18:00:00', number_of_seats: 7)

