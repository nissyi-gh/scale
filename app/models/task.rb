class Task < ApplicationRecord
  enum status: {
    todo: 0,
    doing: 1,
    pending: 2,
    done: 3,
    archived: 4
  }

  validates :title, presence: true
  validates :status, presence: true
end
