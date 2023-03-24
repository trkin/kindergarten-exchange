FactoryBot.define do
  factory :admin_user do
  end

  factory(:user) do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
