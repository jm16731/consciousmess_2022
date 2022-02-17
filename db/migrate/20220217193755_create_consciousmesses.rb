class CreateConsciousmesses < ActiveRecord::Migration[6.1]
  def change
    create_table :consciousmesses do |t|

      t.timestamps
    end
  end
end
