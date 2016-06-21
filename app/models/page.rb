class Page < ActiveRecord::Base
	 # Relations
	 belongs_to :subject
	 has_and_belongs_to_many :editors, :class_name => "AdminUser"
	# has_many :sections
end
