class CellarWine < ActiveRecord::Base
	belongs_to :cellar
	belongs_to :wine
end