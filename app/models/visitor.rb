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

class Visitor < ActiveRecord::Base
  acts_as_votable

  validates :ip, :cookie_id, presence: true
  validates :ip, uniqueness: {scope: :cookie_id}

  def cast_votes
    ActsAsVotable::Vote.all.by_type(Visitor).where(voter_id: self.id)
  end

end
