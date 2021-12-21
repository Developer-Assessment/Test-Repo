class CreateImageFlippers < ActiveRecord::Migration[6.1]
  def change
    create_table :image_flippers do |t|

      t.timestamps
    end
  end
end
