class User < ApplicationRecord
  has_many :dogs
  has_many :user_events
  has_many :events, through: :user_events
  validates :username, uniqueness: true
  has_many :wishlists

  def authenticate(plaintext_password)
   BCrypt::Password.new(self.password_digest) == plaintext_password
 end

 def password=(plaintext_password)
   self.password_digest = BCrypt::Password.create(plaintext_password)
 end


end
