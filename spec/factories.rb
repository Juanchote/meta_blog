#require 'rspec'

FactoryGirl.define do
  factory :first_comment do
    title ""
    post "Best Entry ev4h"
  end

  factory :blog_entry do
    id 1
    title "First Entry"
    post "Testing the first Blog Entry"
  end


end