class Rating < ActiveRecord::Base
  belongs_to :customer
  belongs_to :book

  validates :review, :rating, presence: true
  validates_inclusion_of :rating, :in => 1..10
end
