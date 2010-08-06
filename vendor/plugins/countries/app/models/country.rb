class Country < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :description, :extension]

  validates_presence_of :title
  validates_uniqueness_of :title

  has_many :resorts
  has_many :hotels, :through => :resort

end
