class Game < ApplicationRecord
  has_many :plays
  has_many :users, through: :plays
  belongs_to :manufacturer

  accepts_nested_attributes_for :manufacturer, reject_if: :all_blank
end
