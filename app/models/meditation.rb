class Meditation < ApplicationRecord
  has_one_attached :meditationFile
  belongs_to :collection
end
