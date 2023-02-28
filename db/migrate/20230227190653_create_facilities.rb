class CreateFacilities < ActiveRecord::Migration[7.0]
  def change
    create_table :facilities do |t|
      t.string :name
      t.integer :membercost
      t.float :guestcost
      t.integer :initialoutlay
      t.integer :monthlymaintenance

      t.timestamps
    end
  end
end
