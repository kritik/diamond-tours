class Resort < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :description]

  validates_presence_of :title
  validates_uniqueness_of :title

  belongs_to :tour_type
  belongs_to :currency
  belongs_to :country
  has_many :hotels
  has_many :travels, :through => :hotels

end
