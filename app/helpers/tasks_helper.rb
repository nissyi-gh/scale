module TasksHelper
  def render_sub_task_tree(task, level = 0)
    if task.sub_tasks.any?
      content_tag(:ol) do
        task.sub_tasks.each do |sub_task|
          concat(content_tag(:li, class: "level-#{level}") do
            concat render_task_status(sub_task)
            concat sub_task.title
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
      content_tag(:span, "✓", class: "status done")
    when "doing"
      content_tag(:span, task.status, class: "status doing")
    when "pending"
      content_tag(:span, task.status, class: "status pending")
    else
      content_tag(:span, task.status, class: "status")
    end
  end

  def render_task_controls(task)
    content_tag(:div, class: "task-controls") do
      render_task_deadline_form(task) +
      render_task_add_form(task) +
      render_task_delete_form(task) +
      render_task_todo_form(task) +
      render_task_doing_form(task) +
      render_task_pending_form(task) +
      render_task_done_form(task)
    end
  end

  def render_task_deadline_form(task)
    content_tag(:div, class: "task-form task-deadline-form task-form-visible") do
      form_with model: task, method: :patch do |f|
        concat f.date_field :deadline
        concat f.submit "Set"
      end
    end
  end

  def render_task_add_form(parent_task)
    content_tag(:div, class: "task-form task-form-visible") do
      form_with model: @task do |f|
        concat f.hidden_field :parent_task_id, value: parent_task.id
        concat f.text_field :title
        concat f.submit "+"
      end
    end
  end

  def render_task_delete_form(task)
    content_tag(:div, class: "task-form task-form-visible") do
      form_with model: task, method: :delete do |f|
        concat f.submit "-", class: "delete-sub-task"
      end
    end
  end

  def render_task_form(task, task_status)
    content_tag(:div, class: "task-form task-form-visible") do
      form_with model: task, method: :patch do |f|
        concat f.hidden_field :status, value: task_status
        concat f.submit task_status.camelize, class: "#{task_status}-sub-task"
      end
    end
  end

  %w[todo doing done pending].each do |status|
    define_method("render_task_#{status}_form") do |task|
      render_task_form(task, status)
    end
  end
end
