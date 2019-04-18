FactoryBot.define do
  factory :treatment do
    medication
    dosage { '100mL / hour' }
    start_date { Date.today }
    end_date { Date.tomorrow }
    patient
  end
end
