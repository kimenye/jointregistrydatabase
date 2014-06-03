namespace :data do
	desc "Clean up DB" do
		task :clean_up => :environment do
			SuperAdmin.delete_al
			Surgeon.delete_al
			HospitalAdmin.delete_al
			Hospital.delete_al
			Patient.delete_al
		end
	end

	desc "Seed DB with initial data" do
		task :seed => :environment do
			# super_admin = SuperAdmin.create! :email => "admin@jointregistry.com", :password => "superpassword"
		    hospital_admin = HospitalAdmin.create! :email => "hos@adm.in", :password => "12345678"
		    surgeon = Surgeon.create! :email => "sur@ge.on", :password => "12345678"
		end
	end
end