class User < ApplicationRecord
  has_many :plays
  has_many :games, through: :plays
  has_secure_password

  validates :name, uniqueness: true, length: { in: 2..20}
  validates :password, presence: true, on: :create
end
