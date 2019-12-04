class CreateNewswirePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :newswire_posts do |t|
      t.text :content
      t.references :member, null: false, foreign_key: true

      t.timestamps
    end
    add_index :newswire_posts, [:member, :created_at]
  end
end
