class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :surname
      t.string :firstname
      t.string :address
      t.integer :zipcode
      t.string :telephone
      t.integer :recommendedby
      t.timestamp :joindate

      t.timestamps
    end
  end
end
