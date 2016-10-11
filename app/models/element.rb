class Element < ApplicationRecord
    self.primary_key = 'id'
    validates :id, presence: true, uniqueness: true
    validates :name, presence: true
    validates :description, presence: true
end
