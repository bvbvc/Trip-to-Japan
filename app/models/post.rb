class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :place
    validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  mount_uploader :eye_catch, Eye_catchUploader 
  
  
  has_many :favorites,dependent: :destroy
  has_many :liked, through: :favorites, source: :user
end
