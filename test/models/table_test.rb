require 'test_helper'

class TableTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    test 'three tables exist' do
       assert_equal 3, Table.all.size
    end
end
