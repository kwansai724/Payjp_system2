# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |n|
  name = "サンプルユーザー#{n+1}"
  email = "sample#{n+1}@email.com"
  password = "password"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    confirmed_at: Time.now
  )
end
puts "サンプルユーザー作成"


Plan.create!(
  name: "膣美人オンラインサロン",
  price: "3,000",
  plan_id: "1"
)
puts "プラン作成"