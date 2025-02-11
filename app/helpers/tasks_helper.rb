module TasksHelper
  def render_sub_task_tree(task)
    if task.sub_tasks.any?
      content_tag(:ol) do
        task.sub_tasks.each do |sub_task|
          concat(content_tag(:li) do
            concat sub_task.title
            concat render_sub_task_tree(sub_task)
          end)
        end
      end
    end
  end
end