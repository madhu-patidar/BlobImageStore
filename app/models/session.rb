class Session < ApplicationRecord
  has_many :image_stores, dependent: :destroy

end
