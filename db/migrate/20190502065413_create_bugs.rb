class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :title
      t.datetime :deadline
      t.string :type
      t.string :status
      t.string :screen_shot

      t.timestamps
    end
  end
end
