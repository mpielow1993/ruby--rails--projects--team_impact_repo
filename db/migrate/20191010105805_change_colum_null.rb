class ChangeColumNull < ActiveRecord::Migration[6.0]
  def change
    change_column :testimonials, :email, :string, null: false
    change_column :testimonials, :city, :string, null: false
    change_column :testimonials, :country, :string, null: false
  end
end
