require 'csv'

namespace :import_csv do
  desc "Import CSV Data"
  task :run, [:csv_path, :model] => :environment do |t, args|
    model_class = args[:model].constantize
    model_class.destroy_all
    model_attr = model_class.new.attributes.keys - %w[ created_at updated_at ]

    CSV.foreach(args[:csv_path]) do |row|
      attributes = {}
      model_attr.each_with_index do |key, index|
        attributes[key] = row[index]
      end
      model_class.create!(attributes)
      puts "Row added!"
    end
  end
end
