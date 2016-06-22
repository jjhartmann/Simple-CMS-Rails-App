class DemoController < ApplicationController

	layout false 

	# the index view
	def index
		# the name of the template to use : render(:template => "demo/hello")
  		# render('hello')
  	end

  	# the hello view
  	def hello
  		# render('index')
  		
  		# instance var
  		@array = [1,2,3,4,5]
  		@id = params[:id]
  		@page = params[:page].to_i
  		@name = params[:name]

  	end

  	def otherHello
  		redirect_to(:controller => 'demo', :action => 'index')

  		# ASSIUME THAT IT IS the same controller redirect_to(:action => 'index')
  	end

  	def lynda
  		redirect_to("http://www.jjhartmann.org")
		end


		def text_helpers

		end
end
