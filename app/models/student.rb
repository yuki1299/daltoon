class Student < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :classroom
  has_one :exam
end