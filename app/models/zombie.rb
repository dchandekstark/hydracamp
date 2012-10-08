class Zombie < ActiveRecord::Base
  attr_accessible :graveyard, :name
  validates_presence_of :name
  validates_uniqueness_of :name
end
