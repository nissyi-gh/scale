module TasksHelper
  def render_sub_task_tree(task, level = 0)
    if task.sub_tasks.any?
      content_tag(:ol) do
        task.sub_tasks.each do |sub_task|
          concat(content_tag(:li, class: "level-#{level}") do
            concat content_tag(:span, "#{sub_task.id}: ", class: "task-id")
            concat sub_task.title
            concat render_task_status(sub_task)
            concat render_task_controls(sub_task)
            concat render_sub_task_tree(sub_task, level + 1)
          end)
        end
      end
    end
  end

  def render_task_status(task)
    case task.status
    when "done"
      content_tag(:span, "✓", class: "status")
    else
      content_tag(:span, task.status, class: "status")
    end
  end

  def render_task_controls(task)
    content_tag(:div, class: "task-controls") do
      content_tag(:span, "+", class: "add-sub-task") +
      content_tag(:span, "-", class: "delete-sub-task") +
      content_tag(:span, "✓", class: "complete-sub-task")
    end
  end
end