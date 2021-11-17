class User < ApplicationRecord
  include ApiKey
  validates :email, :password_digest, presence: true
  validates :email, uniqueness: true
  validates :api_key, uniqueness: true

  has_secure_password

  def assign_api_key
    self.api_key = ApiKey.generate
  end
end
