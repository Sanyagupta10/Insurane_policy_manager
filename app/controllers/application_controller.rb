class ApplicationController < ActionController::Base
  include SessionsHelper
  include CommentsHelper
  include PoliciesHelper
end
