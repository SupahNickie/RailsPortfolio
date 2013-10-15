class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content

      t.timestamps
    end

    create_table :projects do |t|
      t.string :name
      t.string :technologies_used

      t.timestamps
    end

  end
end
