require 'rails_helper'

RSpec.describe Reference, :type => :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:url) }
  it { should belong_to(:icon) }
  it { should belong_to(:entry) }
end
