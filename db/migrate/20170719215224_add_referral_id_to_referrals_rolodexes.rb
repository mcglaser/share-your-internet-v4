class AddReferralIdToReferralsRolodexes < ActiveRecord::Migration[5.1]
  def change
    add_column :referrals_rolodexes, :referral_id, :integer
  end
end
