class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :author, foreign_key: { to_table: :users }, null: false, index: true
      t.references :post, foreign_key: true, null: false, index: true
      t.text :text

      t.timestamps
    end
  end
end
