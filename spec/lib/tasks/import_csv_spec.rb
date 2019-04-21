require 'rake'
require "rails_helper"

RSpec.describe "Import CSV" do
  before do
    Rake.application.rake_require('tasks/import_csv')
    Rake::Task.define_task(:environment)
  end

  it "imports csv data to model" do
    expect(Patient.count).to eq 0
    Rake::Task['import_csv:run'].invoke('data/patient.csv', 'Patient')
    expect(Patient.count).to eq 1000
  end
end
