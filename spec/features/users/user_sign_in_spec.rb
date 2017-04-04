require 'rails_helper'

RSpec.feature 'User log in' do

  scenario 'can log in with proper credentials' do
    visit new_user_path

    fill_in "user[name]", with: 'Drew'
    fill_in "user[password]", with: 'password'
    click_on 'Create User'

    expect(page).to have_content("Successfully created account!")
  end
end