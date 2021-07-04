class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :newswire_post, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true

      t.timestamps
    end
    add_index :comments, [:member_id, :created_at], name: 'find_comments_by_member_id'
    add_index :comments, [:newswire_post_id, :created_at], name: 'find_comments_by_newswire_post_id'
    add_index :comments, [:member_id, :newswire_post_id, :created_at], unique: true, name: 'find_unique_comment'
  end
end
