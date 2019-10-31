class Meditation < ApplicationRecord
  has_one_attached :meditationFile
  belongs_to :collection
  has_many :comments

  validates :name,
            presence: true,
            uniqueness: true
  validates :collection_id, presence: true
  validates :meditationFile, presence: {
    message: "Dodaj plik z medytacją.."
  }
end
