# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(:id => '0', :name => "hoge", :email => "hoge", :encrypted_password => ENV["USER0_PASSWORD"], :created_at => "2019-05-12 12:21:39", :updated_at => "2019-05-12 12:21:39")
Buyer.create(:id => '0'. :user_id => '0', :created_at => "2019-05-12 12:21:39", :updated_at => "2019-05-12 12:21:39")
Category.create(:id => '1', :created_at => "2019-05-12 12:21:39", :updated_at => "2019-05-12 12:21:39")
Bland.create(:id => '1', :created_at => "2019-05-12 12:21:39", :updated_at => "2019-05-12 12:21:39")
