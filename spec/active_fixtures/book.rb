class Bookes < ActiveFixtures::Resource
  attribute :title, type: String, default: 'admin@lvh.me'
  attribute :description, type: String, default: 'admin@lvh.me'
  attribute :genre, type: String, default: 'admin@lvh.me'
  attribute :author, type: String, default: 'admin@lvh.me'
  attribute :publication_at, type: String, default: 'admin@lvh.me'
  attribute :publisher, type: String, default: 'admin@lvh.me'
end