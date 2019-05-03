class AddBugsToProject < ActiveRecord::Migration[5.2]
  def change
  	add_reference :bugs, :project, foreign_key: true
  end
end
