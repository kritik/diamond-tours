class Travel < ActiveRecord::Base

  acts_as_indexed :fields => [:ftype, :rtype, :city, :ttype, :com, :source]

  validates_presence_of :hotel_id
  validates_uniqueness_of :hotel_id

  belongs_to :hotel
  belongs_to :country
  belongs_to :resort
  belongs_to :currency
  belongs_to :section


end
