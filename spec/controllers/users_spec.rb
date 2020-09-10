require "rails_helper"

RSpec.describe UsersController do

    before(:all) do
        @test_user_admin = User.create!(:email => ENV['TEST_USER_EMAIL'], :name => ENV['TEST_USER_NAME'], :surname => ENV['TEST_USER_SURNAME'],
        :username => ENV['TEST_USER_USERNAME'] , :category => 'Architecture', :roles_mask => 4, :password => ENV['TEST_USER_PSW'], 
        :password_confirmation => ENV['TEST_USER_PSW'], confirmed_at: Time.now.utc)

        @test_user_artlover = User.create!(:email => 'test1.user@testing.com', :name => ENV['TEST_USER_NAME'], :surname => ENV['TEST_USER_SURNAME'],
        :username => ENV['TEST_USER_USERNAME'] , :category => 'Architecture', :roles_mask => 2, :password => ENV['TEST_USER_PSW'], 
        :password_confirmation => ENV['TEST_USER_PSW'], confirmed_at: Time.now.utc)

        @test_user_base = User.create!(:email => 'test2.user@testing.com', :name => ENV['TEST_USER_NAME'], :surname => ENV['TEST_USER_SURNAME'],
        :username => ENV['TEST_USER_USERNAME'] , :category => 'Architecture', :roles_mask => 1, :password => ENV['TEST_USER_PSW'], 
        :password_confirmation => ENV['TEST_USER_PSW'], confirmed_at: Time.now.utc, :reviews_number => 9)
    end

    after(:all) do
        User.delete_all
        Artwork.delete_all
    end



    it "should NOT return users list if the user has base privileges" do
        sign_in @test_user_base
        get :index

        expect(response.status) == 403
        expect(response.body.include? 'redirected').to be_truthy
    end

    it "should NOT return users list if the user has artlover privileges" do
        sign_in @test_user_artlover
        get :index

        expect(response.status) == 403
        expect(response.body.include? 'redirected').to be_truthy
    end

    it "should return users list if the user has admin privileges" do
        sign_in @test_user_admin
        get :index

        expect(response.status) == 200
    end

    it "should NOT allow a base user to block another user" do
        sign_in @test_user_base
        get :edit, params: {operation: 'block' , id: @test_user_artlover}

        expect(response.status) == 403
        expect(response.body.include? 'redirected').to be_truthy
    end

    it "should NOT allow an artlover user to block another user" do
        sign_in @test_user_artlover
        get :edit, params: {operation: 'block' , id: @test_user_base}

        expect(response.status) == 403
        expect(response.body.include? 'redirected').to be_truthy
    end

    it "should NOT allow an admin user to block another admin" do
        sign_in @test_user_admin
        get :edit, params: {operation: 'block' , id: @test_user_admin}

        expect(response.status) == 400
        expect(response.body.include? 'You cannot block this user').to be_truthy
    end

    it "should return 404 if no user was found with the given ID" do
        sign_in @test_user_artlover
        get :edit, params: {operation: 'block' , id: rand(1000)}

        expect(response.status) == 404
        expect(response.body.include? 'No user found').to be_truthy
    end

    it "should NOT allow an artlover user to unblock another user" do
        sign_in @test_user_artlover
        get :edit, params: {operation: 'unblock' , id: @test_user_base}

        expect(response.status) == 403
        expect(response.body.include? 'redirected').to be_truthy
    end

    it "should NOT allow an base user to unblock another user" do
        sign_in @test_user_base
        get :edit, params: {operation: 'unblock' , id: @test_user_base}

        expect(response.status) == 403
        expect(response.body.include? 'redirected').to be_truthy
    end


end