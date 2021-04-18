class AddTargetToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :target, :integer
  end
end
