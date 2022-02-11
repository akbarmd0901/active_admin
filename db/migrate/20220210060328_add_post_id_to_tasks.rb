class AddPostIdToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :post_id, :integer
  end
end
