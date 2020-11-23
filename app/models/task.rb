class Task < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :details, presence: true
  validates :details, uniqueness: true
end
