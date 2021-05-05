class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title
      t.string :unit
      t.string :icon
      t.integer :target

      t.timestamps
    end
  end
end
