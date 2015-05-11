class Game < ActiveRecord::Base

  has_many :joins,
      -> { extending WithUserAssociationExtension },
      dependent: :restrict_with_exception

  belongs_to :user
  has_many :users
end
