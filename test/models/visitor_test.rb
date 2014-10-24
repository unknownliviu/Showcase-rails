# == Schema Information
#
# Table name: visitors
#
#  id         :integer          not null, primary key
#  ip         :string(255)
#  cookie_id  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class VisitorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
