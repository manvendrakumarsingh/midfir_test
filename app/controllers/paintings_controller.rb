class PaintingsController < ApplicationController

	def new
		@penting = Penting.new
	end	
end
