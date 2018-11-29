class Session < ApplicationRecord
  has_many :work_logs, dependent: :destroy
  has_many :idle_time, dependent: :destroy
  belongs_to :user
  
  default_scope { order(created_at: :desc)}

end
