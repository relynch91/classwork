class Poem < ApplicationRecord
    validates :title, :stanzas, presence: true 
    
    belongs_to :author,
        foreign_key: :user_id,
        class_name: :User 
end
