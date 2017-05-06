# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
require 'pp' #TODO debugging

# HOW TO RUN
# rake db:seed {environment-name}=yes
# example: rake db:seed movie=yes will run the ENV["movie"] portion


if ENV["movie"]
  user = User.all[0]

  csv_text = File.read(Rails.root.join('lib', 'seeds', 'movie_metadata.csv'))
  csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
  csv.each do |row|

    params = {
      rating: row["imdb_score"],
      url:    row["movie_imdb_link"],
      name:   row["movie_title"],
      description: "I am a bot. Beep boop."
    }
    p = user.posts.build(params)
    p.save
  end
end



#csv_text = File.read(Rails.root.join('lib', 'seeds', 'movie_metadata.csv'))
#csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
#csv.each do |row|
#
#  params = {
#    rating: row["imdb_score"],
#    url:    row["movie_imdb_link"],
#    name:   row["movie_title"],
#    description: "I am a bot. Beep boop."
#  }
#  p = user.posts.build(params)
#  p.save
#end
