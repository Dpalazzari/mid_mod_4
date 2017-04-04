require 'rails_helper'

RSpec.feature "User log in" do
  before(:each) do
    @user   = User.create(name: "Drew", email:"Drew@drew", password: 'password')
    @user_2 = User.create(name: "Babooshka", email:"bab@ooshka", password: 'password')
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
end