class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, presence: true

  has_many :user_groups
  has_many :groups, through: :user_groups
end
