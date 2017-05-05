class CreateBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :boards do |t|
      t.references :owner, foreign_key: { to_table: :users }, index: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
