class Menu < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :menu_tags, dependent: :destroy
  has_many :tags, through: :menu_tags
  belongs_to :genre, optional: true
  has_one_attached :menu_image

  validates :genre_id, presence: true
  validates :title, presence: true, length: { in: 1..20 }
  validates :body, presence: true, length: { in: 1..120 }

  def get_menu_image(width,height)
    unless menu_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      menu_image.attach(io: File.open(file_path), filename: 'no_image.jpeg', content_type: 'image/jpeg')
    end
    menu_image.variant(resize_to_limit: [width,height]).processed
  end

  # 検索分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @menu = Menu.where("title LIKE?", "#{word}")
    elsif search == "forward_match"
      @menu = Menu.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @menu = Menu.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @menu = Menu.where("title LIKE?","%#{word}%")
    else
      @menu = Menu.all
    end
  end

end
