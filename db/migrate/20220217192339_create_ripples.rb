class CreateRipples < ActiveRecord::Migration[6.1]
  def change
    create_table :ripples do |t|
      t.string :name
      t.date :posted
      t.text :message
      t.string :url

      t.timestamps
    end
  end
end
