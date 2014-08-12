# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	#@in = HelpInstitution.create( name: 'Intitución FIFA anti bullying', identifier: rand(3..5000), addres: 'San Nicolas de la Garza y Garcia Nuevo León #4564', phone: 34234234,  ext:90)
	#puts @in
	#@user = User.create(name: 'Manolo Lama', email: 'manolo@mail.com', charge: 'Supervisor', password: Digest::SHA2.hexdigest('alfredo2008'), password_confirmation: Digest::SHA2.hexdigest('alfredo2008') , salt:  rand(235..1234),  terms_of_service: true, confirmation: true, admin_attributes: false, adviser: true, adviser_code: rand(5000..909090), help_institution_id: @in.id)
	#@user2 = User.create(name: 'Manito Quepes', email: 'manito@mail.com', charge: 'Supervisor', password: Digest::SHA2.hexdigest('alfredo2008'), password_confirmation: Digest::SHA2.hexdigest('alfredo2008'), salt:  rand(235..1234), terms_of_service: true, confirmation: true, admin_attributes: false, adviser: true, adviser_code: rand(5000..909090), help_institution_id: @in.id)
	#@user3 = User.create(name: 'Jorge Campos ', email: 'campos@mail.com', charge: 'Supervisor', password: Digest::SHA2.hexdigest('alfredo2008'), password_confirmation: Digest::SHA2.hexdigest('alfredo2008'), salt:  rand(235..1234), terms_of_service: true, confirmation: true, admin_attributes: false, adviser: true, adviser_code: rand(5000..909090), help_institution_id: @in.id)
	#@user4 = User.create(name: 'Luis Garcia ', email: 'garcia@mail.com', charge: 'Supervisor', password: Digest::SHA2.hexdigest('alfredo2008'), password_confirmation: Digest::SHA2.hexdigest('alfredo2008'), salt:  rand(235..1234), terms_of_service: true, confirmation: true, admin_attributes: false, adviser: true, adviser_code: rand(5000..909090), help_institution_id: @in.id)
	#puts @user
	#puts @user2
	#puts @user3
	#puts @user4

	####### creando aministrador #########

	@user = User.create(name: 'Alfredo Reyes', email: 'alfredo@cursa.me', charge: 'Director de Innovación', password: Digest::SHA2.hexdigest('alfredo2008'), password_confirmation: Digest::SHA2.hexdigest('alfredo2008') , terms_of_service: true, salt: rand(1..2323), confirmation: true, admin_attributes: true, adviser: true, adviser_code: rand(5000..909090)) 
	@i = Institution.create( name: 'Cúrsame', url: 'cursa.me', user_id: @user.id, phone: 63632893, extencion: 01) 
