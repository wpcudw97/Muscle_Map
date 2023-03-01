class Evaluation < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :evaluation, presence: true

end
