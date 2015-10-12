class Task < ActiveRecord::Base
	def complete?
		return completed == true
	end
end
