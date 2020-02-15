class User < ApplicationRecord
  has_many :article
  has_many :comment
  validates :name, presence:true
  validates :email, presence:true
end
