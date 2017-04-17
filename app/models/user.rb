class User < ApplicationRecord
  has_secure_password

  validates :name, :password, :email, presence: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true

  has_many :links

end
