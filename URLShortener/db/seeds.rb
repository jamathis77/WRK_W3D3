# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do

  User.destroy_all
  user1 = User.create(:email => "cal.jee7@gmail.com")
  user2 = User.create(:email => "vriscool@gmail.com")
  user3 = User.create(:email => "hololens@microsoft.com")
  user4 = User.create(:email => "visualFX@jake.com")
  user5 = User.create(:email => "mamajoojoo@mamashouse.com")

  ShortenedUrl.destroy_all
  # shortened_url1 = ShortenedUrl.create(
  # shortened_url2 = ShortenedUrl.create(



end
