Given /^a registered user$/ do
  password = ENV['TEST_USER_PSW']
  User.create!(:email => "luca.andolfi03@gmail.com", :name => ENV['TEST_USER_NAME'], :surname => ENV['TEST_USER_SURNAME'],
  :username => ENV['TEST_USER_SURNAME'] , :category => 'Architecture', :roles_mask => 4, :password => password, 
  :password_confirmation => password, confirmed_at: Time.now.utc)
end

Given /^a registered base user$/ do
  password = ENV['TEST_USER_PSW_2']
  User.create!(:email => "ferrazzivalentina@gmail.com", :name => ENV['TEST_USER_NAME_2'], :surname => ENV['TEST_USER_SURNAME_2'],
  :username => ENV['TEST_USER_SURNAME_2'] , :category => 'Architecture', :roles_mask => 0, :password => password, 
  :password_confirmation => password, confirmed_at: Time.now.utc)
end

Given /^a logged in user$/ do
    visit new_user_session_path
    fill_in "Email", :with => ENV['TEST_USER_EMAIL']
    fill_in "Password", :with => ENV['TEST_USER_PSW']
    click_button "Log in"
end

Given /^I am a base user$/ do
    test_user = User.find_by(email: ENV['TEST_USER_EMAIL'])
    test_user.roles_mask = 1
    test_user.save
end

Given /^I am an artlover user$/ do
    test_user = User.find_by(email: ENV['TEST_USER_EMAIL'])
    test_user.roles_mask = 2
    test_user.save
end

Given /^I am an admin user$/ do
    test_user = User.find_by(email: ENV['TEST_USER_EMAIL'])
    test_user.roles_mask = 4
    test_user.save
end

