class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }, presence: true
  after_create :add_api_key

  def self.email_in_use?(email)
    !User.find_by(email: email).nil?
  end

  private
  def add_api_key
    self.update(api_key: SecureRandom.hex)
  end
end
