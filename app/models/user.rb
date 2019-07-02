class User < ApplicationRecord
  has_many :plays
  has_many :games, through: :plays
  has_secure_password

  validates :name, presence: true, uniqueness: true, length: { in: 2..20}
  validates :password, presence: true

end
