require "test_helper"

class VacanciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vacancy = vacancies(:one)
  end

  test "should get index" do
    get vacancies_url
    assert_response :success
  end

  test "should get new" do
    get new_vacancy_url
    assert_response :success
  end

  test "should create vacancy" do
    assert_difference('Vacancy.count') do
      post vacancies_url, params: { vacancy: { available: @vacancy.available, company_id: @vacancy.company_id, description: @vacancy.description, location: @vacancy.location, requirements: @vacancy.requirements, salary: @vacancy.salary, title: @vacancy.title } }
    end

    assert_redirected_to vacancy_url(Vacancy.last)
  end

  test "should show vacancy" do
    get vacancy_url(@vacancy)
    assert_response :success
  end

  test "should get edit" do
    get edit_vacancy_url(@vacancy)
    assert_response :success
  end

  test "should update vacancy" do
    patch vacancy_url(@vacancy), params: { vacancy: { available: @vacancy.available, company_id: @vacancy.company_id, description: @vacancy.description, location: @vacancy.location, requirements: @vacancy.requirements, salary: @vacancy.salary, title: @vacancy.title } }
    assert_redirected_to vacancy_url(@vacancy)
  end

  test "should destroy vacancy" do
    assert_difference('Vacancy.count', -1) do
      delete vacancy_url(@vacancy)
    end

    assert_redirected_to vacancies_url
  end
end
