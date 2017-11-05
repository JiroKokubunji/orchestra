require 'csv'

namespace :create_algorithm_data do
  desc "create algorithm entry into mongodb"
  task :machine_learning_algorithms => :environment do
      MachineLearningAlgorithm.delete_all
      csv_file = Rails.root.join('lib', 'tasks', 'machine_learning_algorithms.csv')
      CSV.foreach(csv_file, headers: true).each do |al|
        a = MachineLearningAlgorithm.new
        a.category = al["category"]
        a.module_name = al["module_name"]
        a.class_name = al["class_name"]
        a.save
      end
  end
  task :preprocess_algorithms => :environment do
      PreprocessAlgorithm.delete_all
      csv_file = Rails.root.join('lib', 'tasks', 'preprocess_algorithms.csv')
      CSV.foreach(csv_file, headers: true).each do |al|
        a = PreprocessAlgorithm.new
        a.category = al["category"]
        a.module_name = al["module_name"]
        a.class_name = al["class_name"]
        a.save
      end
  end
end
