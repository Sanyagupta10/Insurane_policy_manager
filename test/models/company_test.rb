require "test_helper"

class CompanyTest < ActiveSupport::TestCase
  def setup
    @company = Company.new(name: "Example company", description: "abcd")
  end
  test "name should be present" do
    @company.name = " "
    assert_not @company.valid?
  end    
  test "description should be present" do
    @company.description = " "
    assert_not @company.valid?
  end 
end
