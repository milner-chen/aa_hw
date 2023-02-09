class House < ApplicationRecord

    has_many(
       :residents,
       class_name: ‘Person’,
       foreign_key: :professor_id,
       primary_key: :id
     )
   
   validates :address, presence: true
   
end