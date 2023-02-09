class Person< ApplicationRecord
    validates :name, presence: true

    # validates for presence by default
    belongs_to(
        :house,
        class_name: ‘House’,
        foreign_key: :house_id,
        primary_key: :id
      )
end
