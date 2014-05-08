class CreateTablePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user
      t.integer :points
      t.string :title
      t.string :link
      t.timestamps
    end
  end
end


# Titles by Insung Aiden Lee of the Fiddler Crabs
