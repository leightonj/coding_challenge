FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name(nil, %w[. _ - @]) }
    password { Faker::Internet.password(8, 10) }
    usertoken { Faker::Internet.password(8, 10) }
  end
end
