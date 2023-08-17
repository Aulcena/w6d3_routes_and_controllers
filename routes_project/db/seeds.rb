# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ApplicationRecord.transaction do

    # These `destroy_all` commands are not necessary if you use `rails
    # db:seed:replant`
    puts 'Destroying tables...'
    User.destroy_all
    ArtworkShare.destroy_all
    Artwork.destroy_all
    
    puts 'Resetting id sequences...'

    %w(users artworks artwork_shares).each do |table_name|
    ApplicationRecord.connection.reset_pk_sequence!(table_name)
  end

  puts 'Populating the database'
  user_1 = User.create!(username: :AJ)
  user_2 = User.create!(username: :Tracey)
  user_3 = User.create!(username: :Jeff)
  user_4 = User.create!(username: :Maya)

  artwork_1 = Artwork.create!(title: :Untitled, image_url: 'google.com', artist_id: user_1.id)
  artwork_2 = Artwork.create!(title: 'lil wayne', image_url: 'culture.com', artist_id: user_2.id)
  artwork_3 = Artwork.create!(title: :Peace, image_url: 'nature.com', artist_id: user_3.id)

#   ArtworkShare.create!(artwork_id: artwork_1.id, viewer_id: user_4.id)
  ArtworkShare.create!(artwork_id: artwork_2.id, viewer_id: user_3.id)
  ArtworkShare.create!(artwork: artwork_1, viewer: user_2)
  
  puts "Datebase populated"


end