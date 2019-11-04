class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :meditation

  validates :content, presence: {
    message: "Dodaj treść komentarza.."
  }
end
