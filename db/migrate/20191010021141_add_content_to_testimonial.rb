class AddContentToTestimonial < ActiveRecord::Migration[6.0]
  def change
    add_column :testimonials, :content, :text 
  end
end
