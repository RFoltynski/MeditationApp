class Subscription < ApplicationRecord
  balongs_to :user
  belongs_to :collection
end
