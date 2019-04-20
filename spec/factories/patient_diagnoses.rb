FactoryBot.define do
  factory :patient_diagnosis do
    diagnosis
    start_date { Date.today }
    end_date { Date.tomorrow }
    diagnosing_provider { create(:provider) }
    patient
  end
end
