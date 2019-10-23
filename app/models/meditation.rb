class Meditation < ApplicationRecord
  has_one_attached :meditationFile
  belongs_to :collection

  validates :name,
            presence: true,
            uniqueness: true
end
