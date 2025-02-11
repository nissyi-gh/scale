class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :parent_task, null: true, foreign_key: { to_table: :tasks }
      t.integer :status, null: false, default: 0
      t.string :title, null: false
      t.text :note
      t.timestamps
    end

    add_index :tasks, :status
  end
end
