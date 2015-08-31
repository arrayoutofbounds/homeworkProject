class User < ActiveRecord::Base
	has_many :assignments
	has_many :homeworks, through: :assignments, source: :homework
	has_many :answers

	def full_name
		"#{firstname} #{lastname}"
	end

	def student?
		usertype=="Student"
	end

	def teacher?
		usertype=="Teacher"
	end
end
