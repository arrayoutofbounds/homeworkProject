class Homework < ActiveRecord::Base
	has_many :assignments
	has_many :users, through: :assignments, source: :user
	has_many :answers

	def latest_answers
		ans = []
		count = users.count
		users.each do |u|
			a = answers.where(user_id: u.id).order('id desc').first
			if a
				ans.push(a)
			end
		end
		ans
	end

	def is_due_date_passed?
		
		dd = Date.parse(duedate.to_s)
		#puts dd
		#puts Date.today
		(dd-Date.today).to_i < 0
	end
end
