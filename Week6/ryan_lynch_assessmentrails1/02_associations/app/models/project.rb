class Project < ApplicationRecord
    has_many :assignments,
        foreign_key: :project_id,
        class_name: :ProjectAssignment
    
    belongs_to :project_manager,
        foreign_key: :project_manager_id,
        class_name: :Employee

    has_many :programmers,
        through: :assignments,
        source: :programmer

    has_one :company,
        through: :programmers,
        source: :company
    
end
