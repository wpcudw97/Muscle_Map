class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :evaluations, dependent: :destroy
  has_many :weight_managements, dependent: :destroy

  validates :name, presence: true, length: { maximum: 10 }
  validates :name_kana, presence: true
  validates :date_of_birth, presence: true
  validates :sex_select, presence: true
  validates :introduction, length: { in: 0..30 }

  has_one_attached :profile_image

  enum sex_select: { #性別選択
    male: 0,
    female: 1,
    other: 2,
    no_answer: 3
  }

  enum is_deleted: { #会員ステータス
    有効: false,
    退会: true
  }

  def get_profile_image(width,height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/No_image.jpeg')
    profile_image.attach(io: File.open(file_path), filename: 'No_image.jpeg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width,height]).processed
  end
end