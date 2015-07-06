require 'rails_helper'

RSpec.describe Book, type: :model do
  subject { FactoryGirl.create :book }

  it { expect(subject).to validate_presence_of(:title) }
  it { expect(subject).to validate_presence_of(:price) }
  it { expect(subject).to validate_presence_of(:quentity_books) }
  it { expect(subject).to have_many(:ratings) }
  it { expect(subject).to belong_to(:author) }
  it { expect(subject).to belong_to(:category) }

end