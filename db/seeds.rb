# Create tasks

Task.create(title: "Root Task", status: :todo)
Task.create(title: "Sub Task 1", status: :doing, parent_task: Task.first)
Task.create(title: "Sub Task 2", status: :pending, parent_task: Task.first)