require 'rails_helper'

RSpec.feature 'User log in' do

  it 'can log in with proper credentials' do
    visit new_user_path
    fill_in "user[name]", with: 'Drew'
    fill_in "user[email]", with: "Drew@email"
    fill_in "user[password]", with: 'password'
    fill_in "user[password_confirmation]", with: 'password'
    click_on 'Create User'

    expect(page).to have_content("Successfully created account!")
  end
end
