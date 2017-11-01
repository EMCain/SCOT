#encoding: utf-8

user = User.create(
  :username => 'ben',
  :email => 'sisko@starfleet.org',
  :password => '123456',
  :password_confirmation => '123456'
)

Given /^a user who is (not )?logged in/ do |logged_out|
  # if not logged_out, log them in as a user
  # see https://stackoverflow.com/questions/1271788/session-variables-with-cucumber-stories#1295106
  # and https://stackoverflow.com/questions/6466045/testing-login-with-devise-and-cucumber#6478892
  Capybara.using_session("Ben's session") do
    if logged_out
      puts "logged out"
    else
      puts "LOGGING IN --------"
      # TODO move this out of here to be done at setup; create multiple users based on passed in name
      user = User.create(
        :username => 'ben',
        :email => 'sisko@starfleet.org',
        :password => '123456',
        :password_confirmation => '123456'
      )
      visit 'users/sign_in'
      fill_in('user_email', :with => user.email)
      fill_in('user_password', :with => user.password)
      within('.actions') do
        find('[name=commit]').click
      end
    end
  end
end

When /^(?:she|he|xie|they) visit(?:s)? the ([\w|\/|_]+) page$/ do |page_url|
  # visit 'http://' + Capybara.server_host + ':' + Rack::Server.new.options[:Port].to_s + page_url
  # visit 'http://localhost:8000' + page_url
  using_session("Ben's session") do
    # for some reason the session cookies are erased by this step
    visit 'http://localhost:3000/broadcast/items'
  end
end

Then /^(?:she|he|xie|they) should see a message that says "(.*)"$/ do |msg|
  using_session("Ben's session") do
    page.should have_content msg
  end
end
