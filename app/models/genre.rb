class Genre < ApplicationRecord
  
  has_many :menus, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true

end
