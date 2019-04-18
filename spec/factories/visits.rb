FactoryBot.define do
  factory :visit do
    visit_date { Date.today }
    notes { Faker::Quote.matz }
    provider
    patient
  end
end
