class Collection < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true;
  has_many :meditations
end