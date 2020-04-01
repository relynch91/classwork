class Goal < ApplicationRecord
    validates :name, :details, :user_id, presence: true
    validates :status, inclusion: { in: [true, false] }

    belongs_to :user,
        foreign_key: :id,
        class_name: :User 
end
