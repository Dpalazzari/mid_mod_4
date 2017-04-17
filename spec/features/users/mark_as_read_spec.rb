require "rails_helper"

RSpec.describe "can mark links as read", type: :feature, :js => :true do
  before(:each) do
    user = create(:user)
    link = Link.create(url:"https://turing.io", title:"Turing")
    user.links << link
    page.set_rack_session(user_id: user.id)
    visit "/"
  end
  scenario "Mark a link as read" do
    within('.link .read-status') do
      expect(page).to have_text("false")
    end

    click_on "Mark as Read"

    within('.link .read-status') do
      expect(page).to have_text("true")
    end
  end

  scenario "Mark a link as unread" do
    within('.link .read-status') do
      expect(page).to have_text("false")
    end

    click_on "Mark as Read"

    within('.link .read-status') do
      expect(page).to have_text("true")
    end

    click_on 'Mark as Unread'

    within('.link .read-status') do
      expect(page).to have_text("false")
    end
  end
end
