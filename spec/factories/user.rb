# frozen_string_literal: true

FactoryBot.define do
  # factory :vendor, class: User do
  factory :user do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    role { 'user' }

    trait :vendor do
      role { 'vendor' }
    end
  end
end
