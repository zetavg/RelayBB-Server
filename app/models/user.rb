class User < ApplicationRecord
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates :username, length: { minimum: 1, maximum: 16 }
  validates :password, presence: true, allow_nil: true
  validates :password, presence: true, unless: :persisted?
  validates :password, length: { minimum: 4, maximum: 32 }, allow_nil: true
  validate :validate_password_confirmation_match, unless: proc { |u| u.password_confirmation.nil? }

  attr_reader :password
  attr_accessor :password_confirmation

  def password=(password)
    @password = password
    self.encrypted_password = Digest::SHA256.hexdigest(password)
  end

  private

  def validate_password_confirmation_match
    errors.add(:password_confirmation, :not_match) if password != password_confirmation
  end
end
