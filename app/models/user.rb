class User < ApplicationRecord
  has_many :destinations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
