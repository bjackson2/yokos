# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create!(email: 'dude@duderson.com', password: "asdf1234")
user2 = User.create!(email: 'dame@damely.com', password: "asdf1234")

member = YokosMember.create!(name: "Dude Duderson", user: user)
member2 = YokosMember.create!(name: "Dame Damely", user: user2)

artist = Artist.create!(name: "Lou Reed")
album = Album.create!(title: "Transformer", artist: artist, release_date: DateTime.parse('November 8, 1972'))
album2 = Album.create!(title: "Berlin", artist: artist, release_date: DateTime.parse('October 5, 1973'))

artist2 = Artist.create!(name: "David Bowie")
album3 = Album.create!(title: "Diamond Dogs", artist: artist2, release_date: DateTime.parse('May 24 1974'))

session = ListeningSession.create!(session_type: :remote, date: Date.current, theme: "Solo artists")
session.attendees << member
session.attendees << member2
session.listening_session_albums.create!(album: album, yokos_member: member)
session.listening_session_albums.create!(album: album3, yokos_member: member2)

session2 = ListeningSession.create!(session_type: :remote, date: 1.week.ago, theme: "70s music")
session2.attendees << member
session2.attendees << member2
session2.listening_session_albums.create!(album: album2, yokos_member: member)
session2.listening_session_albums.create!(album: album3, yokos_member: member2)
