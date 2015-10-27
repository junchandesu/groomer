require 'faker'

10.times do
	user = User.new(
		email:  Faker::Internet.email,
		password: Faker::Lorem.characters(10)
		)
	user.skip_confirmation!
	user.save!
end


user = User.new(
	email: 'aliciajace@gmail.com',
	password: 'helloworld',
	)
	user.skip_confirmation!
	user.save!

admin = User.new(
     email:    'admin@example.com',
     password: 'helloworld',
     role:     'admin'
   )
   admin.skip_confirmation!
   admin.save!

users = User.all



puts "Seed finished"
puts "#{User.count} users created"
