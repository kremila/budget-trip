class CreateMessages < ActiveRecord::Migration[8.1]
  def change
    create_table :messages do |t|
      t.text :question
      t.text :answer
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
