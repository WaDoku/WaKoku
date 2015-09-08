FactoryGirl.define do
  factory :icon do
    icon File.open("spec/fixtures/wiki.png")
  end

end
