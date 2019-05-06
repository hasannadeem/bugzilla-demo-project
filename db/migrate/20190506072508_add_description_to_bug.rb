class AddDescriptionToBug < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :description, :text
  end
end
