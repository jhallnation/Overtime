FactoryGirl.define do
  factory :post do
    date Date.today
    ratinale "Some Ratinale"
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    ratinale "Some more content"
    user
  end
end