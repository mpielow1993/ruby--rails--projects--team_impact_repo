class CreateTestimonials < ActiveRecord::Migration[6.0]
  def change
    create_table :testimonials do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
