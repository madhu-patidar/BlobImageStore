class IdleTime < ApplicationRecord
  belongs_to :session

  default_scope { order(created_at: :desc)}
end
