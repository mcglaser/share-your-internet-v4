class AddRolodexIdToReferrals < ActiveRecord::Migration[5.1]
  def change
    add_column :referrals, :rolodex_id, :integer
  end
end
