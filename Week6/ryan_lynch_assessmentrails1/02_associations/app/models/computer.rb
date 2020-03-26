class Computer < ApplicationRecord
    belongs_to :owner,
        foreign_key: :owner_id,
        class_name: :Employee
end
