class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :credit_card
  belongs_to :billing_adress, class_name: "Address"
  belongs_to :shipping_adress, class_name: "Address"

  has_many   :order_items


  validates  :complited_date, :state, presence: true
  validates  :state, presence: true, inclusion: {in: %W{in\ progress completed shipped}}

  before_validation do
    self.state ||= "in progress"
    self.total_price
  end

  def add_book(book)
    item = self.order_items.where(book: book).first
    if item
      item.quantity +=1
      item.save
      self.order_items.reload
    else
      self.order_items << OrderItem.create(price: book.price, quantity: 1, book: book, order: self)
    end
  end

  def total_price
    items_price = self.order_items.map {|item| item.quantity*item.price}
    self.complited_date = Time.now
    self.total_price = items_price.inject(&:+) || 0

  end
end
