require 'rails_helper'

RSpec.describe Icon, :type => :model do
  it{ should have_many(:references) }
end
