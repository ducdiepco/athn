FactoryBot.define do
  factory :patient do
    first_name { 'first' }
    last_name { 'last' }
    sequence(:email) { |n| Faker::Internet.email }
  end
end
