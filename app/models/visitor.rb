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
  
  validates :ip, :cookie_id, presence: true
  validates :ip, uniqueness: {scope: :cookie_id}
end
