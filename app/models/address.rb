class Address < ActiveRecord::Base

  validates  :address, :zipcode, :city, :phone, :country, presence: true
  belongs_to :country
  has_many   :orders
end
