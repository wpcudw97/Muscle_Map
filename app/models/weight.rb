class Weight < ApplicationRecord
  belongs_to :user

  has_one_attached :profile_image

  def get_profile_image(width,height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/No_image.jpeg')
    profile_image.attach(io: File.open(file_path), filename: 'No_image.jpeg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width,height]).processed
  end
end
