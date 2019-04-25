class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }
  
  belongs_to :user_group
  has_many :groups, through: :user_group
end
