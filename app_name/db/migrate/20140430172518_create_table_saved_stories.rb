class CreateTableSavedStories < ActiveRecord::Migration
  def change
    create_table :saved_stories do |t|
      t.references :user
      t.references :post
      t.timestamps
    end
  end
end
