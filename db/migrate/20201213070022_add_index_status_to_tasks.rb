class AddIndexStatusToTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :status, :integer, null: false
  end
end
