require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  # validates_presence_of :email
  # validates_format_of :email, as: :email_address

  property :id, Serial
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, String, length: 60

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.validate(email, password)
    if user = User.first(email)
      return true if BCrypt::Password.new(user.password_digest) == password
    end
    false
  end

end