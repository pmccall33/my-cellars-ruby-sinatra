class Wine < ActiveRecord::Base
	belongs_to :cellar
	has_many :cellars, through: :cellar_wines
end