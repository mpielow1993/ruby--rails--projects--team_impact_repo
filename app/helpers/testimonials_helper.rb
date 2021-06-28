module TestimonialsHelper
    def join_attributes(testimonial)
        array = []
        testimonial.attributes.each do |key, value|
            array.push(value.to_s)
        end
        array[1] + " " + array.values_at(2, 4, 5).join(", ")
    end
end
