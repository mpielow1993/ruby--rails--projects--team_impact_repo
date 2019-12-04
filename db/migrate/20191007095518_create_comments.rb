class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :newswire_post, null: false, foreign_key: true

      t.timestamps
    end
    add_index :comments, [:member, :created_at], name: 'find_comments_by_member'
    add_index :comments, [:newswire_post, :created_at], name: 'find_comments_by_newswire_post'
    add_index :comments, [:member, :newswire_post, :created_at], unique: true, name: 'find_unique_comment'
  end
end
