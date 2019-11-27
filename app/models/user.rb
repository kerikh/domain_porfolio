class User < ActiveRecord::Base
  has_secure_password

  validates :username, :email, presence: true, uniqueness: true
  validates :password, presence: true, format: {
    with: /\A[a-zA-Z0-9!@#\$%^&\(\)]+\z/,
    message: "only allows a-z, 0-9 and !@#$%^&*()"
  }

  has_many :domain_names
  has_many :services


  private

end
