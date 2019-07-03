class Play < ApplicationRecord
  belongs_to :user
  belongs_to :game

  def play_game
    self.user.tokens -= self.game.token_cost
    self.user.save(validate: false)
  end
end
