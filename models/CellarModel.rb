class Cellar < ActiveRecord::Base
	has_many :wines
	belongs_to :user
end