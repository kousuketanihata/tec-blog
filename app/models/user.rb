class User < ActiveRecord::Base
  
  has_many :articles
  validates :name, presence: true
  validates :password, length: { minimum: 6 }
  has_secure_password
   # attr_accessor :name, :email
	before_save { email.downcase }
  	# before_create :create_remember_token

  	def User.new_remember_token
    	SecureRandom.urlsafe_base64
  	end

    def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
    end

  	def User.encrypt(token)
    	Digest::SHA1.hexdigest(token.to_s)
  	end

  	private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end





end
