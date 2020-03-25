class ProjectAssignment < ApplicationRecord
    belongs_to :programmer,
        foreign_key: :programmer_id,
        class_name: :Employee
        
    belongs_to :project,
        foreign_key: :project_id,
        class_name: :Project

end
