class Hotel < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :stars, :description]

  validates_presence_of :title
  validates_uniqueness_of :title

  belongs_to :resort
  belongs_to :country
  belongs_to :currency
  has_many :travels

end
