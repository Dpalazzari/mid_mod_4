class User < ApplicationRecord
  has_secure_password

  validates_confirmation_of :password

  validates :name, :password, :email, presence: true
  validates :email, uniqueness: true

  has_many :links

end
