class CreatePreprocesses < ActiveRecord::Migration[5.1]
  def change
    create_table :preprocesses do |t|

      t.timestamps
    end
  end
end
