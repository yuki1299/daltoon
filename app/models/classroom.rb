class Classroom < ActiveRecord::Base
	validates_presence_of :school, :slug
  validates :code, :slug, uniqueness: true

	has_many :students
	belongs_to :teacher
end