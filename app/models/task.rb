class Task < ApplicationRecord
  validates :name, presence: true
  validates :details, presence: true
  enum status: { 未着手: 0, 着手: 1, 完了: 2 }
  enum priority: { 高: 0, 中: 1, 低: 2 }

  # scope :search, -> (search_params) do
  #   return if search_params.blank?
  #
  #   name_like(search_params[:name])
  #     .status_is(search_params[:status])

  # scope :name_like, -> (name) { where('name LIKE ?', "%#{params[:search]}%") if params[:search].present? }

  scope :search_with_name, -> (name) {
    where("name LIKE ?", "%#{ name }%")
  }
  scope :search_with_details, -> (details) {
    where("details LIKE ?", "%#{ details }%")
  }
  scope :search_with_status, -> (status) {
    where(status: status)
  }
  # scope :search_with_label, -> (label_id) {
  #   task_ids = Labeling.where(label_id: label_id).pluck(:task_id)
  #   where(id: task_ids)
  # }

  end


# scope :name_like, -> (name) { where('name LIKE ?', "%#{params[:search]}%") if params[:search].present? }
# scope :status_is, -> (status) { where(status: status) if status.present? }

# end
