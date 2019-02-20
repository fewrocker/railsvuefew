class Todo < ApplicationRecord
  validates :name, presence: true
  validates :priority, presence: true
end
