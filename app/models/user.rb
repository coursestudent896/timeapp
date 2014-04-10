class User < ActiveRecord::Base
	has_one :invoice


	validates :email, :presence => true, :uniqueness => {:case_sensitive => false}
	validates :password, length: { minimum: 3, maximum: 9 }

	validates :password, :confirmation => true



	# before_save :encrypt_password

	# def self.authenticate 
		 # user = User.find_by_email(params[:email])
		 # if user && user.authenticate(params[:password]) ==
			# BCrypt::Engine.hash_secret password, user.salt
			# user
		# else
			# false
		# end
      # end

    # def encrypt_password
    	# if password.present?
    		# self.salt = BCrypt::Engine.generate_salt
    		# self.password = BCrypt::Engine.hash_secret password, salt
    	# end
    # end


def confirm!
	self.update_attributes(
       :unique_token => nil,
       :verifiedstatus => true
		)
end



def generate_unique_token!
	self.update_attribute(:unique_token, SecureRandom.hex(40))
end

end