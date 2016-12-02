class Lend < ApplicationRecord
  belongs_to :student
  belongs_to :element
  #has_one :element
end
