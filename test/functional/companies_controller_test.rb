require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post :create, company: { director_designation: @company.director_designation, director_email: @company.director_email, director_name: @company.director_name, director_phone: @company.director_phone, name: @company.name, semester_id: @company.semester_id, technical_designation: @company.technical_designation, technical_email: @company.technical_email, technical_name: @company.technical_name, technical_phone: @company.technical_phone }
    end

    assert_redirected_to company_path(assigns(:company))
  end

  test "should show company" do
    get :show, id: @company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company
    assert_response :success
  end

  test "should update company" do
    put :update, id: @company, company: { director_designation: @company.director_designation, director_email: @company.director_email, director_name: @company.director_name, director_phone: @company.director_phone, name: @company.name, semester_id: @company.semester_id, technical_designation: @company.technical_designation, technical_email: @company.technical_email, technical_name: @company.technical_name, technical_phone: @company.technical_phone }
    assert_redirected_to company_path(assigns(:company))
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete :destroy, id: @company
    end

    assert_redirected_to companies_path
  end
end
