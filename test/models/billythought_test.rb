require 'test_helper'

class BillythoughtTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    def setup
        @user = users(:testman)
        @billythought = @user.billythoughts.build(content: "Lorem ipsum")
    end

    test "should be valid" do
        assert @billythought.valid?
    end

    test "user id should be present" do 
        @billythought.user_id = nil
        assert_not @billythought.valid?
    end

    test "content should be present" do
        @billythought.content = "  "
        assert_not @billythought.valid?
    end

    test "order should be most recent first" do
        assert_equal billyposts(:most_recent), Billythought.first
    end
    
end
