class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|

      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :address_line_one
      t.string :address_line_two
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :internet_type
      t.string :internet_speed
      t.decimal :monthly_cost, :precision => 8, :scale => 2
      t.string :community_name
      t.boolean :admin, default: false

      t.timestamps null: false
    end
  end
end
