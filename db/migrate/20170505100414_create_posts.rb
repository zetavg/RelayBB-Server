class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :author, foreign_key: { to_table: :users }, null: false, index: true
      t.references :board, foreign_key: true, null: false, index: true
      t.string :subject
      t.text :text

      t.timestamps
    end
  end
end
