class CreateTrips < ActiveRecord::Migration[8.1]
  def change
    create_table :trips do |t|
      t.string :departure
      t.decimal :budget
      t.integer :duration

      t.timestamps
    end
  end
end
