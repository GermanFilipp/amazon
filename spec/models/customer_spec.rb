require 'rails_helper'

RSpec.describe Customer, type: :model do
  subject { FactoryGirl.create :customer }

  it { expect(subject).to validate_presence_of(:first_name) }
  it { expect(subject).to validate_presence_of(:last_name) }
  it { expect(subject).to validate_presence_of(:email) }
  it { expect(subject).to validate_uniqueness_of(:email) }
  it { expect(subject).to have_many(:orders) }
  it { expect(subject).to have_many(:ratings) }



end