module TasksHelper
  def render_sub_task_tree(task)
    if task.sub_tasks.any?
      content_tag(:ol) do
        task.sub_tasks.each do |sub_task|
          concat(content_tag(:li) do
            concat sub_task.title
            concat render_task_status(sub_task)
            concat render_sub_task_tree(sub_task)
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
end