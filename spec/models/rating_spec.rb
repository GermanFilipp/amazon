require 'rails_helper'

RSpec.describe Rating, type: :model do
  subject { FactoryGirl.create :rating }

  it { expect(subject).to validate_presence_of(:review) }
  it { expect(subject).to validate_presence_of(:rating) }
  it { expect(subject).to belong_to(:customer) }
  it { expect(subject).to belong_to(:book) }
end