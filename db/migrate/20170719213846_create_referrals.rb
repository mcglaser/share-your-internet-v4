class CreateReferrals < ActiveRecord::Migration[5.1]
  def change
    create_table :referrals do |t|

      t.string :ref_first_name
      t.string :ref_last_name
      t.string :ref_address_line_one
      t.string :ref_address_line_two

      t.timestamps null: false
    end
  end
end
