# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.where(username: 'tejaspatel')
if not u
	u = User.new
	u.username = 'tejaspatel'
	u.firstname = 'Tejas'
	u.lastname = 'Patel'
	u.usertype='Teacher'
	u.save
end 

u1 = User.where(username: 'Anmol')

unless u1
	User.create!(:username => 'Anmol', firstname: 'Anmol', lastname:'Desai', usertype: 'Student')
end

