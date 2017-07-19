class ReferralRolodex < ActiveRecord::Base
  belongs_to :referral
  belongs_to :rolodex
end