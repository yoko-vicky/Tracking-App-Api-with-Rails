class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.integer :result, null: false
      t.references :item, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :date, null: false

      t.timestamps
    end
  end
end
