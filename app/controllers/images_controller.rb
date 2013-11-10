# encoding: utf-8
class ImagesController < ApplicationController
	def index
		@images = DataFile.order("created_at DESC").limit(5)
	    respond_to do |format|
	      format.html # index.html.erb
	      format.json { render json: @images }
	    end
	end

	def uploadFile
		post = DataFile.save(params)
		render :text => "File has been uploaded successfully"
	end
end
