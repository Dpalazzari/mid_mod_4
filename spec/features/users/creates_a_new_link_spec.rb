require 'rails_helper'

describe "User creates Link", :type => :feature, :js => true do
  xit 'creates a new link' do
    create(:link)
    user = create(:user)
    page.set_rack_session(user_id: user.id)

    expect(Link.all.count).to eq(1)
    visit root_path
    
    fill_in "link-title", :with => "Twitch"
    fill_in "link-url", :with => "https://www.twitch.tv"
    click_link_or_button "create-link"

    expect(Link.all.count).to eq(2)

    within('#all-links') do
      expect(page).to have_content("Twitch")
    end
  end
end