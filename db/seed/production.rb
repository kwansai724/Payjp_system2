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
