require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  subject { FactoryGirl.create :credit_card }

  it { expect(subject).to validate_presence_of(:CVV) }
  it { expect(subject).to validate_presence_of(:expiration_month) }
  it { expect(subject).to validate_presence_of(:expiration_year) }
  it { expect(subject).to validate_presence_of(:first_name) }
  it { expect(subject).to validate_presence_of(:last_name) }
  it { expect(subject).to validate_presence_of(:number) }
  it { expect(subject).to belong_to(:customer) }
  it { expect(subject).to have_many(:orders) }

end