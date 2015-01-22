FactoryGirl.define do
  factory :certification do |f|
      f.title       { "#{Faker::Company.name} Certification" }
      f.created_at  { Time.now }
      f.expires     { Faker::Date.forward(30) }
      f.link        { Faker::Internet.url }
  end

end
