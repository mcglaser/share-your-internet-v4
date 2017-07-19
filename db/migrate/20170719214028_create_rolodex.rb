class CreateRolodex < ActiveRecord::Migration[5.1]
   def change
    create_table :rolodexes do |t|

    t.string :nickname

    
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    end
  end
end
