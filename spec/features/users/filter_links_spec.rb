require 'rails_helper'


RSpec.describe "Can filter links", type: :feature, :js => :true do
  before(:each) do
    user   = create(:user)
    link   = Link.create(url:"https://www.turing.io", title:"Turing")
    link2  = Link.create(url:"https://www.youtube.com", title:"Youtube")
    user.links << link
    user.links << link2
    page.set_rack_session(user_id: user.id)
    visit "/"
  end

  scenario 'Filter the youtube link' do
    fill_in "filter-link", with: 'You'
    within('#all-links') do
      expect(page).to have_content("Youtube")
      expect(page).to_not have_content("Turing")
    end
  end

  scenario 'Filter the Turing link' do
    fill_in "filter-link", with: 'tur'
    within('#all-links') do
      expect(page).to_not have_content("Youtube")
      expect(page).to have_content("Turing")
    end
  end
end
