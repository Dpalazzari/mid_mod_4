require "rails_helper"

RSpec.describe "can mark links as read", type: :feature, :js => :true do
  xscenario "Mark a link as read" do
    Link.create(url:"https://turing.io", title:"Turing")
    visit "/"
    save_and_open_page
    within('.link .read-status') do
      expect(page).to have_text("false")
    end

    click_on "Mark as Read"

    within('.link .read-status') do
      expect(page).to have_text("true")
    end

  end
end
