# frozen_string_literal: true

require 'test_helper'

class PolicyTest < ActiveSupport::TestCase
  def setup
    @policy = Policy.new(policy_type: 'Example policytype', description: 'abcd', company_id: '1',
                         policytype_id: '1', user_id: '1',
                         premium_amt: '10000', sum_insured: '1000000', commission: '2000',
                         purchase_date: '07-09-2022', mature_date: '07-09-2027')
  end
  test 'policytype should be present' do
    @policy.policy_type = ' '
    assert_not @policy.valid?
  end
  test 'company_id should be present' do
    @policy.company_id = ' '
    assert_not @policy.valid?
  end
  test 'policytype_id should be present' do
    @policy.policytype_id = ' '
    assert_not @policy.valid?
  end
  test 'user_id should be present' do
    @policy.user_id = ' '
    assert_not @policy.valid?
  end
  test 'premium_amt should be present' do
    @policy.premium_amt = ' '
    assert_not @policy.valid?
  end
  test 'sum_insured should be present' do
    @policy.sum_insured = ' '
    assert_not @policy.valid?
  end
  test 'purchase date should be present' do
    @policy.purchase_date = ' '
    assert_not @policy.valid?
  end
  test 'mature date should be present' do
    @policy.mature_date = ' '
    assert_not @policy.valid?
  end
end
