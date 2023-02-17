# ./photo.rb
require './lib/commentable'

class Photo
	include	Commentable

	attr_reader :image_source, :caption, :comments

	def initialize(image_source, caption)
		@image_source = image_source
		@caption = caption
		@comments = {}
	end

	# def display
	# 	# display_string = "-" * 50 + "\n"
	# 	# display_string += "PHOTO" + "\n"
	# 	# display_string += "URL: #{image_source}" + "\n"
	# 	# display_string += "Caption: #{caption}" + "\n"
	# 	# comments.each do |id, text|
	# 	# 	display_string += "#{id}: #{text}" + "\n"
	# 	# end
	# 	# display_string += "-" * 50
	# 	# return display_string
	# end
end
