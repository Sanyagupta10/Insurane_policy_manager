# frozen_string_literal: true

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = Comment.new(body: 'Example comment', user_id: '1', policy_id: '1')
  end
  test 'body should be present' do
    @comment.body = ' '
    assert_not @comment.valid?
  end
  test 'user_id should be present' do
    @comment.user_id = ' '
    assert_not @comment.valid?
  end
  test 'policy_id should be present' do
    @comment.policy_id = ' '
    assert_not @comment.valid?
  end
  test 'should report error' do
    # some_undefined_variable is not defined elsewhere in the test case
    assert_raises(NameError) do
      some_undefined_variable
    end
  end
end
