class CreateConscious < ActiveRecord::Migration[6.1]
  def change
    create_table :conscious do |t|

      t.timestamps
    end
  end
end
