Given /^a registered user$/ do
  password = 'Lukaa98!'
  User.create!(:email => "luca.andolfi03@gmail.com", :name => 'Luca', :surname => 'Andolfi',
  :username => 'Giotto' , :category => 'Architecture', :roles_mask => 4, :password => password, 
  :password_confirmation => password, confirmed_at: Time.now.utc)
end

Given /^a logged in user$/ do
    visit new_user_session_path
    fill_in "Email", :with => "luca.andolfi03@gmail.com"
    fill_in "Password", :with => "Lukaa98!"
    click_button "Log in"
  end

