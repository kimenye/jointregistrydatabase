require "test_helper"

class UsersControllerTest < ActionController::TestCase
  test 'get index' do
	get :index
    assert_response :success
  end

  test 'Approve Users' do
    SuperAdmin.delete_all
    Surgeon.delete_all
    HospitalAdmin.delete_all
    
    super_admin = SuperAdmin.create! :email => "admin@jointregistry.com", :password => "superpassword"
    hospital_admin = HospitalAdmin.create! :email => "hos@adm.in", :password => "12345678"
    surgeon = Surgeon.create! :email => "sur@ge.on", :password => "12345678"
    
    post :approve_surgeons, { "id" => surgeon.id }
    assert_equal true, surgeon.approved

    post :approve_hospital_admins, { "id" => hospital_admin.id }
    assert_equal true, hospital_admin.approved
  end

  test 'Unapprove Users' do
  	SuperAdmin.delete_all
  	Surgeon.delete_all
  	HospitalAdmin.delete_all
  	
  	super_admin = SuperAdmin.create! :email => "admin@jointregistry.com", :password => "superpassword"
  	hospital_admin = HospitalAdmin.create! :email => "hos@adm.in", :password => "12345678", :approved => true
  	surgeon = Surgeon.create! :email => "sur@ge.on", :password => "12345678", :approved => true
    
    post :approve_surgeons, { "id" => surgeon.id }
    assert_equal false, surgeon.approved

    post :approve_hospital_admins, { "id" => hospital_admin.id }
    assert_equal false, hospital_admin.approved
  end
end