class ChangeColumnNull < ActiveRecord::Migration[6.0]
  def change
    change_column :members, :phone_no, :string, null: true
    change_column :enquiries, :phone_no, :string, null: true
    change_column :testimonials, :email, :string, null: true
    change_column :testimonials, :city, :string, null: true
    change_column :testimonials, :country, :string, null: true
  end
end
