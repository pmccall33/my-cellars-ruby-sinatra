class Wine < ActiveRecord::Base
	has_many :cellar_wines
	has_many :cellars, through: :cellar_wines
end