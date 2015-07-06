require 'rails_helper'

RSpec.describe Address, type: :model do

  let(:subject) { FactoryGirl.create :address }

  it { expect(subject).to validate_presence_of :address }
  it { expect(subject).to validate_presence_of :zipcode }
  it { expect(subject).to validate_presence_of :city }
  it { expect(subject).to validate_presence_of :phone }

end