class Ripple < ApplicationRecord
  belongs_to :consciousmess

  validates :name, :posted, :message, presence: true
  validates :url, allow_blank: true, url: true
end
