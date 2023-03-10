class Post < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :evaluations, dependent: :destroy
  belongs_to :user
  has_one_attached :post_image

  validates :title, presence: true, length: { in: 1..20 }
  validates :body, presence: true, length: { in: 1..120 }


  def get_post_image(width,height)
  unless post_image.attached?
    file_path = Rails.root.join('app/assets/images/No_image.jpeg')
    post_image.attach(io: File.open(file_path), filename: 'No_image.jpeg', content_type: 'image/jpeg')
  end
  post_image.variant(resize_to_limit: [width,height]).processed
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # 検索分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?", "#{word}")
    elsif search == "forward_match"
      @post = Post.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @post = Post.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end

end
