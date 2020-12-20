class Task < ApplicationRecord
  validates :name, presence: true
  validates :details, presence: true
  enum status: { 未着手: 0, 着手: 1, 完了: 2 }
  enum priority: { 高: 0, 中: 1, 低: 2 }


  scope :search_with_name, -> (name) {
    where("name LIKE ?", "%#{ name }%")
  }
  scope :search_with_details, -> (details) {
    where("details LIKE ?", "%#{ details }%")
  }
  scope :search_with_status, -> (status) {
    where(status: status)
  }

  end
