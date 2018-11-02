class Device < ApplicationRecord
  # association
  # has_many :sessions, dependent: :destroy

  # validations
  validates :mac_id,
    presence: true,
    uniqueness: true
end
