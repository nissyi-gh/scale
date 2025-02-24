class AddDeadlineToTasks < ActiveRecord::Migration[8.0]
  def change
    add_column :tasks, :deadline, :datetime
  end
end
