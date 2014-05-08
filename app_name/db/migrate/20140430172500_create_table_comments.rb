class CreateTableComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :comment
      t.references :post
      t.integer :points
      t.text :body
      t.timestamps
    end
  end
end
