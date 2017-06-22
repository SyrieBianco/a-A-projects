# == Schema Information
#
# Table name: watch_lists
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class WatchList < ActiveRecord::Base

  #  has a user (FAILED - 19)
  #  has a watch list item (FAILED - 20)

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :watch_list_items,
    primary_key: :id,
    foreign_key: :watch_list_id,
    class_name: :WatchListItem
  #
  # has_many :,
  #   through: :,
  #   source: :,

end