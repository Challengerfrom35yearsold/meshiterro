class PostImage < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image
  end

  def favorited_by?(user)
    #ビューから引数を持ってくる
    favorites.exists?(user_id: user.id)
    #ユーザidがFavoritesテーブル内(user_idカラム)に存在するかどうかを調べる
    #戻り値はtrueかfalse
  end

end
