class ChangeDateToIntInRecords < ActiveRecord::Migration[6.1]
  def change
    remove_column :records, :date, :datetime
    add_column :records, :date, :string
  end
end
