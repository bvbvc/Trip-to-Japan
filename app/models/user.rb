class User < ApplicationRecord
     before_save { self.e_mail.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :e_mail, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
   
   
   
   has_secure_password
   
     mount_uploader :image, ImagesUploader

     
   
   
end
