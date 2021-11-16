class User < ApplicationRecord
  include ApiKey
  before_validation :assign_api_key

  validates :email, :password_digest, :api_key, presence: true
  validates :email, uniqueness: true
  validates :api_key, uniqueness: true

  has_secure_password

  def assign_api_key
    self.api_key = ApiKey.generate
  end
end
