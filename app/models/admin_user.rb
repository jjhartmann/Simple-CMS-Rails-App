class AdminUser < ActiveRecord::Base
	#When change name of class, make sure to change name of file to admin_user
	# To configure a differnt table name
	# self.table_name = "admin_user"
	
	has_and_belongs_to_many :pages
	has_many :section_edits
	has_many :sections, :through => :section_edits

end
