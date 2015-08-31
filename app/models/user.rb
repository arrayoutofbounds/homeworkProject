class User < ActiveRecord::Base
	has_many :assignments
	has_many :homeworks, through: :assignments
end
