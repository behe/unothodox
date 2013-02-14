class CreatePostRecords < ActiveRecord::Migration
  def change
    create_table :post_records do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
