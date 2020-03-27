class Blog < ApplicationRecord
    validates :title, presence: true, uniqueness: true #{ scope: :author_id }
    validates :body, presence: true 

    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User

    has_many :comments, 
        foreign_key: :blog_id,
        class_name: :Comment
end
