#encoding: utf-8

Given /^a user who is (not)? logged in [as a (\w) user]?/ do |logged_out, role|
  pending # if not logged_out, log them in as a user
end

When /^(?:she|he|xie|they) visit(?:s)? the ([\w|\/|_]+) page$/ do |page_url|
  pending # send  a request as this user to the page_url
end

Then /^(?:she|he|xie|they) should see a messge that says "(.*)"$/ do |msg|
  pending # the page content should contain the text "msg"
end
