class AddCreatorRefToBugs < ActiveRecord::Migration[5.2]
  def change
  	add_column :bugs, :creator_id, :bigint , index: true
	add_foreign_key :bugs, :users, column: :creator_id
    # add_reference :bugs, :creator, foreign_key: true
  end
end
