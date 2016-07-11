# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all;
root = User.create!(email: 'mma140@sfu.ca', :password => 'cors2016', :password_confirmation => 'cors2016', :type => 'Admin');
Preference.create!(name: 'Administrator', user_id: root.id);
comp = User.create!(email: 'company@domain.com', :password => 'cors2016', :password_confirmation => 'cors2016', :type => 'Company');
Preference.create!(name: 'Mob Company', user_id: comp.id);
stud = User.create!(email: 'student@domain.com', :password => 'cors2016', :password_confirmation => 'cors2016', :type => 'Student');
Preference.create!(name: 'Mob Student', user_id: stud.id);
