class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :games
  has_many :joined_games, through: :joins, source: :game
  has_many :joins

  def has_joined?(game)
    joined_games.include? game
  end
end
