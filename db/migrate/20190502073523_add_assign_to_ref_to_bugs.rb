class AddAssignToRefToBugs < ActiveRecord::Migration[5.2]
  def change
 	add_column :bugs, :assign_to, :bigint , index: true
	# add_foreign_key :bugs, :users, column: :assign_to_id
  end
end
