 
 2.times do |n|
  email = "admin#{n+1}@email.com"
 Admin.create!(
  # name: "管理者",
  email: email,
  password: "password",
  password_confirmation: "password",
)
end
puts "管理者作成"


25.times do |n|
  name = "サンプルユーザー#{n+1}"
  gender = "女性"
  birthday = "1989/07/#{n+1}"
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
  name: "セラピスト養成コース",
  price: "3,000",
  plan_id: "1"
)
puts "セラピスト養成コース作成"

Plan.create!(
  name: "セルフケアコース",
  price: "1,000",
  plan_id: "2"
)
puts "セルフケアコース作成"
