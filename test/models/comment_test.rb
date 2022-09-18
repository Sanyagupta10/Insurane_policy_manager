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
end
