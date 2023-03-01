class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :menu

  validates :comment, presence: true, length: { in: 1..40 }

end
