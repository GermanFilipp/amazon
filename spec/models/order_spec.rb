require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { FactoryGirl.create :order }

  it { expect(subject).to validate_inclusion_of(:state).in_array(%w(in\ progress completed shipped)) }

  it { expect(subject).to belong_to(:customer) }
  it { expect(subject).to belong_to(:credit_card) }
  it { expect(subject).to have_many(:order_items) }
  it { expect(subject).to belong_to :billing_adress }
  it { expect(subject).to belong_to :shipping_adress }


  it "has a default value" do
    subject.state = nil
    subject.save
    expect(subject.state).to eq "in progress"
  end

  it "#add_book with price 0" do
    expect(subject.total_price).to eq 0
  end
  it "#add two books with price 150, should eq 300" do
    book = FactoryGirl.create(:book, price: 150)
    subject.add_book book
    subject.add_book book
    subject.save
    expect(subject.total_price).to eq 300
  end

  it "should have date" do
    subject.save
    expect(subject.complited_date).not_to eq nil
  end
end