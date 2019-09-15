class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  validates :nick,
            presence: true,
            uniqueness: true
  validate :avatar_extension

  def resize
    return self.avatar.variant(resize: '300x300')
  end

  private

  def avatar_extension
   return unless avatar.attached? && !avatar.content_type.in?(%w[image/jpeg image/png])

   errors.add(:avatar, 'must be a JPG or a PNG file.')
  end


end
