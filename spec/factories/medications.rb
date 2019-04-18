FactoryBot.define do
  factory :medication do
    medication_name { Faker::Music.album }
    manufacturer { Faker::Company.bs }
  end
end
