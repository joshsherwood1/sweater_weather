class User < ApplicationRecord
  has_secure_password

  validates_presence_of :password_digest, require: true

  before_validation {
    (self.email = self.email.to_s.downcase)
  }

  validates_presence_of     :email
  validates_uniqueness_of   :email
end
