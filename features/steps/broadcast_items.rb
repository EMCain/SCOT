#encoding: utf-8

Given /^a user who is (not )?logged in/ do |logged_out|
  # if not logged_out, log them in as a user
end

When /^(?:she|he|xie|they) visit(?:s)? the ([\w|\/|_]+) page$/ do |page_url|
  # visit 'http://' + Capybara.server_host + ':' + Rack::Server.new.options[:Port].to_s + page_url
  # visit 'http://localhost:8000' + page_url
  visit 'http://localhost:3000/broadcast/items'
end

Then /^(?:she|he|xie|they) should see a message that says "(.*)"$/ do |msg|
  page.should have_content msg
end
