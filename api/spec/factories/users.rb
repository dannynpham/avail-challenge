FactoryBot.define do
  factory :user do
    name { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
    email { "#{name}@email.com".downcase }
    phone_number { "+1 (555) 555-#{Faker::PhoneNumber.unique.subscriber_number}" }
    password { "password" }

    trait :otp_confirmed do
      otp_confirmed { true }
    end
  end
end
