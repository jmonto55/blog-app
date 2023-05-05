class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :post, null: false, foreign_key: true
      t.text :text
      t.references :author, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
