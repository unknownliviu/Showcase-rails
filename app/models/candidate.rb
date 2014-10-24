# == Schema Information
#
# Table name: candidates
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  sex        :string(255)
#  university :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Candidate < ActiveRecord::Base
  acts_as_votable
end
