#require 'rspec'

FactoryGirl.define do
  factory :comment do
    id 1
    title ""
    post "Best Entry ev4h"
    blog_entry_id 1
  end

  factory :blog_entry do
    id 1
    title "First Entry"
    post "Testing the first Blog Entry"
  end


end