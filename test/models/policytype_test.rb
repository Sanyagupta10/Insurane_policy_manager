require 'test_helper'

class PolicytypeTest < ActiveSupport::TestCase
  def setup
    @policytype = Policytype.new(name: 'Example policytype', description: 'abcd', company_id: '1',
                                 duration: '5', premium_amt: '10000', sum_insured: '1000000')
  end
  test 'name should be present' do
    @policytype.name = ' '
    assert_not @policytype.valid?
  end
  test 'company id should be present' do
    @policytype.company_id = ' '
    assert_not @policytype.valid?
  end
  test 'duration should be present' do
    @policytype.duration = ' '
    assert_not @policytype.valid?
  end
  test 'premium_amt should be present' do
    @policytype.premium_amt = ' '
    assert_not @policytype.valid?
  end
  test 'sum_insured should be present' do
    @policytype.sum_insured = ' '
    assert_not @policytype.valid?
  end
end
