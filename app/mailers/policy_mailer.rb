class PolicyMailer < ApplicationMailer
  default from: 'insurance_manager@example.com'

  def policy_email
    @usr = User.find_by(@u_id)
    @com = Company.find_by(@c_id)
    @plan = Policytype.find_by(@p_id)
    @policy = Policy.find_by(@pol_id)
    @url = 'http://example.com/policies/policy_email'
    mail(to: @usr.email, subject: 'Policy Details')
  end
end
