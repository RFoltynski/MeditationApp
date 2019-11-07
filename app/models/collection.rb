class Collection < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 1, maximum: 255 }
  has_many :meditations
  has_many :subsciptions
  has_many :users, through: :subsciptions
end
 