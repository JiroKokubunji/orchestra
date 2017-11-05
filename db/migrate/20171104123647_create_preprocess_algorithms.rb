class CreatePreprocessAlgorithms < ActiveRecord::Migration[5.1]
  def change
    create_table :preprocess_algorithms do |t|

      t.timestamps
    end
  end
end
