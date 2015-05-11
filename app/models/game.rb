class Game < ActiveRecord::Base

  has_many :joins,
      -> { extending WithUserAssociationExtension },
      dependent: :restrict_with_exception

  belongs_to :user
  has_many :users

  def has_been_joined?(user)
    joined_by(user).length > 0
  end

  def joined_by(user)
    (joins&user.joins)    
  end
end
