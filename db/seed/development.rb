5.times do |n|
  name = "サンプルユーザー#{n+1}"
  gender = "女性"
  birthday = "1989-07-2#{n+1}"
  address = "大阪府大阪市北区梅田#{n+1}−#{n+1}−#{n+1}"
  email = "sample#{n+1}@email.com"
  password = "password"
  User.create!(
    name: name,
    gender: gender,
    birthday: birthday,
    address: address,
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
