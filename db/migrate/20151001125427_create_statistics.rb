class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.string :name
      t.string :slug
      t.string :url

      t.integer :facebook
      t.integer :google
      t.integer :twitter
      t.integer :reddit
      t.integer :linkedin
      t.integer :pinterest
      t.integer :stumbleupon

      t.timestamps
    end
  end
end
