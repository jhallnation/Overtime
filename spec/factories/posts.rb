FactoryGirl.define do
  factory :post do
    date Date.today
    ratinale "Some Ratinale"
    overtime_request 3.5
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    ratinale "Some more content"
    overtime_request 0.5
    user
  end
end