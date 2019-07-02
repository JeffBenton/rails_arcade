class User < ApplicationRecord
  has_many :plays
  has_many :games, through: :plays
  has_secure_password

  validates :name, uniqueness: true, length: { in: 2..20}
  validates :password, presence: true

  def validate_attribute(attr_name)
    self.valid?
    self.errors[attr_name].blank?
  end

end
