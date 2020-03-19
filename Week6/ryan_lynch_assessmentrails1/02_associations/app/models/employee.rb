class Employee < ApplicationRecord
    has_one :campus_manager,
        foreign_key: :campus_manager_id,
        class_name: :Campus

    has_one :company,
        foreign_key: :ceo_id,
        class_name: :Company
        
    has_one :computer,
        foreign_key: :owner_id,
        class_name: :Computer
    
    has_many :project_assignments,
        foreign_key: :programmer_id,
        class_name: :ProjectAssignment
    
    has_many :projects,
        foreign_key: :project_manager_id,
        class_name: :Projects

    belongs_to :campus,
        foreign_key: :campus_id,
        class_name: :Campus

    has_many :project_managers,
        through: :projects,
        source: :project_manager

end
