class User < ApplicationRecord
    has_secure_password
    has_many :posts, dependent: :destroy
    
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true
  has_secure_password

  def jwt_token
    JWT.encode({ user_id: id, exp: 24.hours.from_now.to_i }, Rails.application.secret_key_base)
  end
end
