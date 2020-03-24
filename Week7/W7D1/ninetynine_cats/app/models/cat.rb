require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    CAT_COLORS = [
        "black", 
        "brown", 
        "orange", 
        "gray"
    ]
    validates :birth_date, :color, :name, :sex, :description, presence: true
    validates :sex, inclusion: { in: %w(M F m f),
        message: "%{value} is not a valid gender" }
    validates :color, inclusion: { in: CAT_COLORS, 
        message: "%{value} is not a valid color" }

    def age
        #time_ago_in_words  DATEHELPERMETHOD
        #need the date of the cats birthday
        #current_time - cats_birthday = age
        time_ago_in_words(self.birth_date)
    end
    # time_ago_in_words(Time.now - birth_date.year) 
end

# class Coffee < ApplicationRecord
#   validates :size, inclusion: { in: %w(small medium large),
#     message: "%{value} is not a valid size" }
# end
