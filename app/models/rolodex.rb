class Rolodex < ActiveRecord::Base
  belongs_to :user
  has_many :referrals
  accepts_nested_attributes_for :referrals
  validates :nickname, presence: true


  def referrals_attributes=(referral_attributes)
    referral_attributes.values.each do |referral_attribute|
      referral = Referral.find_or_create_by(referral_attribute)
      self.referrals << referral
    end
  end

end