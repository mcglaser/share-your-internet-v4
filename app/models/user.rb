class User < ActiveRecord::Base
    belongs_to :community
    has_many :referrals, through: :rolodexes
    has_many :messages
    accepts_nested_attributes_for :referrals    
	before_save { self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
format: { with: VALID_EMAIL_REGEX },
uniqueness: true 
    has_secure_password
    validates :password, length: { minimum: 6 }

    validates :first_name, presence: true
    validates :city, presence: true
    validates :zip_code, presence: true, numericality: { only_integer: true }, length: { minimum: 5, maximum: 5 }
    VALID_MONEY_REGEX = /\A\d+(?:\.\d{0,2})?\z/
    validates :monthly_cost, numericality: true, format: { with: VALID_MONEY_REGEX }, :allow_nil => true






end