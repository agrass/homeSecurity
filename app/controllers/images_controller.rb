class ImagesController < ApplicationController
	def index
		#@files = DataFile.

	    #respond_to do |format|
	    #  format.html # index.html.erb
	    #  format.json { render json: @ip_configs }
	    #end
	end

	def uploadFile
		post = DataFile.save(params)
		render :text => "File has been uploaded successfully"
	end
end
