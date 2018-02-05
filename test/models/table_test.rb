require 'test_helper'

class TableTest < ActiveSupport::TestCase
    test 'three tables exist' do
       assert_equal 3, Table.all.size
    end

    test 'cannot create blank table' do
       assert_not Table.new.valid?
    end

    test 'cannot have negative seating' do
        test_table = Table.new(host_id: 1, table_name: "Test", table_date: 2018-02-07, table_time: '2018-02-07 18:00:00', number_of_seats: -2)
        assert_not test_table.valid?
    end
end
