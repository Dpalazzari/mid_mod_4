# URLockBox

### Developer Notes

The link to heroku can be followed by clicking [here](https://urlockbox-drew.herokuapp.com/users/new)

It really is not worth visiting at this time. I have some issues to work out. They are as follows:

1) I have a problem with the asset pipeline. The app looks and works well on localhost, but once pushing master branch up to heroku, my styling and javascripts are not working. Locally Looks like [this](http://i.imgur.com/KiFmHwE.png)

2) I have features built that I KNOW work locally. I have selenium tests written for them, but again, they won't work. I need advice/guidance/more time to fix these tests.

3) Inconsistency with the 'Mark as Read' and 'Mark as Unread' buttons. The funcitonality is there; but the buttons don't work as well as they should. See the temporary work around *

If you do want to see what I have locally:

From the command line:

```
git clone git@github.com:Dpalazzari/mid_mod_4.git
cd mid_mod_4
bundle
rake db:{create,migrate,seed,test:prepare}
rails s
```

Boot up localhost:3000, login, visit the root path ('/') and the user can view all links provided by the internal API, as well as mark them as read/unread, and create new links via an ajax request.

Latest implementation: Logged in user can filter the links by name. Soon to come: Filter links by read status.

***If you are having trouble with the 'Mark as Read' and 'Mark as Unread' buttons, click somewhere else on the page between clicks and the buttons will work as intended. 


## MidModule Assessment

The URLockbox is a starter app for the mid-module assessment for backend engineering module4 at TuringSchool of Software and Design.

Be sure to get familiar with what is already done, and what is not. No features are complete, but there is some set up done for several features. Use commit history if that helps.

### Testing your JS with Selenium

The app has the `selenium-webdriver` gem listed in the `Gemfile` and setup in the `rails_helper.rb`

#### Setup

Everything will be installed with Bundle.

You will need to download version 46 of Firefox [here](https://www.softexia.com/windows/web-browsers/firefox-46). If you do have it, make sure it is on version 46. Selenium does not work with all versions of Firefox, so make sure that you are using Firefox 46 or else it will potentially cause you problems. 

If you already have Firefox and it's on a version more recent than 46, the easiest way to downgrade is to uninstall Firefox then install version 46.

#### Use

You can then write capybara feature tests and add `js: true` tag if you'd like your test to use the Selenium WebDriver rather than the default WebDriver.  Your tests will execute and recognize your JavaScript.

If you're having problems troubleshooting asynchronous actions (like DOM changes after an AJAX request), [peruse this section of Capybara's docs](https://github.com/teamcapybara/capybara#asynchronous-javascript-ajax-and-friends)

It is highly suggested that you also check out the Capybara docs and and the section on [selenium-webdriver](https://github.com/teamcapybara/capybara#selenium).


