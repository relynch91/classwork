class Employee < ApplicationRecord

    has_one :computer,
        foreign_key: :owner_id,
        class_name: :Computer
    
    has_many :project_assignments,
        foreign_key: :programmer_id,
        class_name: :ProjectAssignment
    
    has_many :projects,
        through: :project_assignments,
        source: :project

    belongs_to :campus,
        foreign_key: :campus_id,
        class_name: :Campus

    has_one :company,
        through: :campus,
        source: :company
    
    has_many :project_managers,
        through: :projects,
        source: :project_manager 

    has_many :projects_led,
        foreign_key: :project_manager_id,
        class_name: :Project 
        
    has_one :campus_manager,
        through: :campus,
        source: :campus_manager
    
    has_many :programmers,
        through: :projects_led,
        source: :programmers

    has_one :managed_campus,
        foreign_key: :campus_manager_id,
        class_name: :Campus 


end
