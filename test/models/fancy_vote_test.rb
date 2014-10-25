# == Schema Information
#
# Table name: fancy_votes
#
#  id           :integer          not null, primary key
#  candidate_id :integer
#  visitor_id   :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class FancyVoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
