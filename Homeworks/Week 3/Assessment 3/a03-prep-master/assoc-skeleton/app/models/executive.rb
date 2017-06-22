# == Schema Information
#
# Table name: executives
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#

class Executive < ActiveRecord::Base

  # has a membership (FAILED - 11)
  # is on a board (FAILED - 12)

  has_many :memberships,
    primary_key: :id,
    foreign_key: :member_id,
    class_name: :BoardMembership

  has_many :boards,
    through: :memberships,
    source: :board
    
end