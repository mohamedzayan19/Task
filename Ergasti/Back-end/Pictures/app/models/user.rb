class User < ActiveRecord::Base
has_many :pictures
# Fields
attr_accessor :password
# Validations
validates :name , :email , presence: true
validates :email , uniqueness: true
# Callbacks
before_save  :encrypt_password, if: -> {self.password.present? }
before_create -> { self.token = SecureRandom.hex }, unless: :token?
# ClassMethods
def self.authenticate(email, password)
	if email.present?&&password.present?
		if user = User.find_by(email: email)
			if user.valid_password?(password)
				user
			end
		end
	end
end

#Methods
def valid_password?(password)
	self.encrypted_password == Digest::MD5.hexdigest(password)
end

def encrypt_password
	self.encrypted_password = Digest::MD5.hexdigest(password)
end

end
