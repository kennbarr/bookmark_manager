require 'bcrypt'

class User

	include DataMapper::Resource

	property :id, Serial
	property :email, String, required: true, format: :email_address, unique: true,
					 messages: {
						 					presence: "We need your email address",
											format: "Invalid email format",
											is_unique: "This email address is already taken"
											}

	property :password_digest, String, length:60



	attr_reader :password
	attr_accessor :password_confirmation

	validates_confirmation_of :password, message: "Password and confirmation password do not match"

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

end
