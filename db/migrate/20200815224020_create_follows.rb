class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.references :following_user, null: false, foreign_key: false
      t.references :followed_user, null: false, foreign_key: false

      t.timestamps
    end
  end
end
