require 'rails_helper'

RSpec.feature "User log in" do
  before(:each) do
    @user   = User.create(name: "Drew", email:"Drew@drew", password: 'password', password_confirmation: 'password')
    @user_2 = User.create(name: "Babooshka", email:"bab@ooshka", password: 'password', password_confirmation: 'password')
  end

  it 'can log in with proper credentials' do
    visit new_user_path
    expect(page).to have_link("Login")
    click_on "Login"

    expect(current_path).to eq(login_path)
    fill_in "email", with: @user.email
    fill_in "password", with: @user.password
    click_on "Login"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Logged in as #{@user.name}.")
  end

  it 'fails to log in user with incorrect password' do
    visit new_user_path
    expect(page).to have_link("Login")
    click_on "Login"

    expect(current_path).to eq(login_path)
    fill_in "email", with: @user.email
    fill_in "password", with: 'wrong_password'
    click_on "Login"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Login Failed")
  end

  it "can log out" do
    page.set_rack_session(user_id: @user.id)

    visit root_path

    click_on "Log out"
    expect(page).to have_content("Successfully logged out.")
    expect(current_path).to eq(login_path)
  end
end
