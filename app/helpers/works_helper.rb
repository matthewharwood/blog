module WorksHelper
	def set_title(title = "Default title")
	  content_for :title, title
	end
end
