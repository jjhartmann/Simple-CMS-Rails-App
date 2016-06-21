class Page < ActiveRecord::Base
	 # Relations
	 belongs_to :subject
	# has_many :sections
end
