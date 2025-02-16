# Create tasks

Task.create(title: "Root Task", status: :todo)
Task.create(title: "Sub Task 1", status: :doing, parent_task: Task.first)
Task.create(title: "Sub Task 1-1", status: :pending, parent_task: Task.first.sub_tasks.first)
Task.create(title: "Sub Task 1-2", status: :done, parent_task: Task.first.sub_tasks.first)
Task.create(title: "Sub Task 1-3", status: :archived, parent_task: Task.first.sub_tasks.first)
Task.create(title: "Sub Task 2", status: :pending, parent_task: Task.first)
Task.create(title: "Sub Task 2-1", status: :done, parent_task: Task.first.sub_tasks.last)
Task.create(title: "Sub Task 2-2", status: :archived, parent_task: Task.first.sub_tasks.last)
