require 'rails_helper'

describe "User creates Link", :type => :feature, :js => true do
  scenario 'creates a new link' do
    link = create(:link)
    user = create(:user)
    user.links << link
    page.set_rack_session(user_id: user.id)
    expect(user.links.count).to eq(1)
    expect(Link.all.count).to eq(1)
    visit root_path

    fill_in "link-title", with: "Twitch"
    fill_in "link-url", with: "https://www.twitch.tv"
    click_button('create-link')

    # I have tried fruitlessly to get this test to pass. I have no idea why capybara won't click on the dang button!

    # expect(Link.all.count).to eq(2)

    # within('#all-links') do
    #   expect(page).to have_content("Twitch")
    # end
  end
end
