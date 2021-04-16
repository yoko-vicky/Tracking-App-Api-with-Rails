class User < ApplicationRecord
  has_secure_password
  has_many :records, dependent: :destroy
  has_many :items, through: :records
  validates :username, presence: true, uniqueness: true
end
