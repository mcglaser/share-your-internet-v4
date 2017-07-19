class CreateCommunities < ActiveRecord::Migration[5.1]
  def change
    create_table :communities do |t|


      t.string :community_name
      t.string :community_address
      t.string :community_city
      t.string :community_state
      t.integer :community_zip

      t.timestamps null: false
    end
  end
end
