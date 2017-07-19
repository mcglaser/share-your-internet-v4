class Community < ActiveRecord::Base
	has_many :users
    validates :community_name, presence: true
    validates :community_address, presence: true
    validates :community_city, presence: true
    validates :community_zip, presence: true, numericality: { only_integer: true }, length: { minimum: 5, maximum: 5 }




end