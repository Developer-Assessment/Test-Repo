class CreateNumberGenerators < ActiveRecord::Migration[6.1]
  def change
    create_table :number_generators do |t|

      t.timestamps
    end
  end
end
