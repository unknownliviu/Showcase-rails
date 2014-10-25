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

class FancyVote < ActiveRecord::Base

  belongs_to :visitor
  belongs_to :candidate

  validates :candidate_id, :visitor_id, presence: true
  validates :candidate_id, uniqueness: {scope: :visitor_id}

  before_validation do
    visitor = Visitor.find_by_id(self.visitor_id)
    candidate = Candidate.find_by_id(self.candidate_id)
    visitor_votes = visitor.fancy_votes
    
    if visitor_votes.count == 0
      next
    elsif visitor_votes.count == 1
      previous_vote = visitor_votes.first
      if previous_vote.candidate.sex == candidate.sex
        self.candidate_id = nil #invalidate object
      end
    end
    if visitor_votes.count >= 2
      self.candidate_id = nil #invalidate
    end
  end
end
