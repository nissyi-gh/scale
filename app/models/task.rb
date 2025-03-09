class Task < ApplicationRecord
  enum :status, {
    todo: 0,
    doing: 1,
    pending: 2,
    done: 3,
    archived: 4
  }

  belongs_to :parent_task, class_name: "Task", optional: true
  has_many :sub_tasks, class_name: "Task", foreign_key: :parent_task_id, dependent: :destroy

  validates :title, presence: true
  validates :status, presence: true

  def root?
    parent_task_id.nil?
  end

  def to_markdown(indent_level = 0)
    checkbox = status == "done" ? "[x]" : "[ ]"
    markdown = "#{"  " * indent_level}- #{checkbox} #{title}\n"

    sub_tasks.each do |child|
      markdown += child.to_markdown(indent_level + 1)
    end

    markdown
  end
end
