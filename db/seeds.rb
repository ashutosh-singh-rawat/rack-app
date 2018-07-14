require 'faker'
require './application'

1000.times{ puts User.create(name: Faker::Name.name).inspect}