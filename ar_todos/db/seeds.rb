require 'faker'
require_relative '../app/models/task.rb'

10.times do 
  Task.create(:description => Faker::Lorem.words(5).join(' '))
end