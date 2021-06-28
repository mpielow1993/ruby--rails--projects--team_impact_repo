class CreateEnquiries < ActiveRecord::Migration[6.0]
  def change
    create_table :enquiries do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_no
      t.text :message

      t.timestamps
    end
  end
end
