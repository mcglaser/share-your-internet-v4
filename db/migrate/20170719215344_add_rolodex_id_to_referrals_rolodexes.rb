class AddRolodexIdToReferralsRolodexes < ActiveRecord::Migration[5.1]
  def change
    add_column :referrals_rolodexes, :rolodex_id, :integer
  end
end
