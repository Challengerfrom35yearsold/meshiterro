class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :post_images, dependent: :destroy
  
  has_one_attached :profile_image
  #profile_imageという名前でActiveStorageで
  #プロフィール画像を保存できるように設定しました。
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_parh = Rails.root.join('app/assers/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_parh), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width,height]).processed
  end
end
