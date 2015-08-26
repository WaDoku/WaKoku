require 'rails_helper'

RSpec.describe Entry, type: :model do
  it { should validate_presence_of(:writing) }
  it { should validate_presence_of(:kana) }
end