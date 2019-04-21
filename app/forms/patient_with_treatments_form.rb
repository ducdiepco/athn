class PatientWithTreatmentsForm
  include ActiveModel::Model

  attr_accessor :first_name, :last_name, :email, :treatments

  attr_reader :patient

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def save
    return self unless valid?
    ActiveRecord::Base.transaction do
      create_patient
      create_treatments
    end
    DoSomething.call patient
    patient
  end

  private

  def create_patient
    @patient = Patient.create!(
      first_name: first_name,
      last_name: last_name,
      email: email
    )
  end

  def create_treatments
    treatments.each do |treatment|
      Treatment.create!(
        medication_id: treatment[:medication_id],
        dosage: treatment[:dosage],
        start_date: treatment[:start_date],
        patient: patient
      )
    end
  end

  def send_email
    SendEmailToAdmin.perform patient
  end
end
