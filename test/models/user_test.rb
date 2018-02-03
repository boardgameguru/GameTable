require 'test_helper'

class UserTest < ActiveSupport::TestCase
    test '3 users exist' do
       assert 3, User.all.size
    end

    test 'cannot create blank user' do
        user_test = User.new
        assert_not user_test.valid?
    end

    test 'new user cannot have same email' do
       user_test = User.create(first_name: 'Test', last_name: 'test', email: 'johndoe@gmail.com', password: 'password', password_confirmation: 'password')
        assert_not user_test.valid?
    end

    test 'no passwords less than 6 characters' do
        user_test = User.create(first_name: 'Test', last_name: 'test', email: 'test@gmail.com', password: 'pass', password_confirmation: 'pass')
        assert_not user_test.valid?
    end
end
