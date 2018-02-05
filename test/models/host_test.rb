require 'test_helper'

class HostTest < ActiveSupport::TestCase
    test 'two users exist' do
       assert_equal 2, Host.all.size
    end

    test 'cannot create blank host' do
        test_host = Host.new
        assert_not test_host.valid?
    end

    test 'cannot create new host with same email' do
       test_host = Host.new(name: 'teststore', address: 'test', phone: '1234567890', email: 'store1@store.com', password: 'password')
        assert_not test_host.valid?
    end

    test 'no passwords less than 6 characters' do
       test_host = Host.new(name: 'teststore', address: 'test', phone: '1234567890', email: 'test@store.com', password: 'pass')
        assert_not test_host.valid?
    end

    test 'create new host' do
        test_host = Host.new(name: 'teststore', address: 'test', phone: '1234567890', email: 'test@store.com', password: 'password')
        assert test_host.valid?
    end
end
