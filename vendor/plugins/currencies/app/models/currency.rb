class Currency < ActiveRecord::Base

  acts_as_indexed :fields => [:currency]

  validates_presence_of :currency
  validates_uniqueness_of :currency

  has_many :resorts
  #has_many :resorts, :through => :resort
  has_many :travels, :through =>:hotel

end
