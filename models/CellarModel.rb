class Cellar < ActiveRecord::Base
	has_many :wines, through: :cellar_wines
	belongs_to :user
end