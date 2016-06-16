# This file should contain all the record creation
# needed to seed the database with its default values.
#
# The data can then be loaded with the rake db:seed
# (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
seed_product_data = [
  { title: 'Galileo Vol I', status: 'Requested' },
  { title: 'Galileo Vol II', status: 'Requested' },
  { title: 'Galileo Vol III', status: 'Requested' },
  { title: 'Galileo Vol IV', status: 'Requested' },
  { title: 'Galileo Vol V', status: 'Requested' },
  { title: 'Famous Quotes From Around The World', status: 'On hold' },
  { title: 'World Encyclopedia Aa-Bi', status: 'Requested' },
  { title: 'World Encyclopedia Bj-Ca', status: 'Requested' },
  { title: 'World Encyclopedia Cb-Da', status: 'Requested' },
  { title: 'World Encyclopedia Db-Ea', status: 'Requested' },
  { title: 'World Encyclopedia Eb-Ef', status: 'Requested' },
  { title: 'World Encyclopedia Eg-Ez', status: 'Requested' },
  { title: 'World Encyclopedia Fa-Hz', status: 'Requested' },
  { title: 'World Encyclopedia Ia-Lz', status: 'Requested' },
  { title: 'World Encyclopedia Ma-Ri', status: 'Requested' },
  { title: 'World Encyclopedia Rj-Tu', status: 'Requested' },
  { title: 'World Encyclopedia Tv-Vz', status: 'Requested' },
  { title: 'World Encyclopedia Wa-Zz', status: 'Requested' },
  { title: 'World Encyclopedia Vol 1', status: 'Requested' },
  { title: 'World Encyclopedia Vol 2', status: 'Requested' },
  { title: 'World Encyclopedia Vol 3', status: 'Requested' },
  { title: 'World Encyclopedia Vol 4', status: 'Requested' },
  { title: 'World Encyclopedia Vol 5', status: 'Requested' },
  { title: 'World Encyclopedia Vol 6', status: 'Requested' },
  { title: 'World Encyclopedia Vol 7', status: 'Requested' },
  { title: 'World Encyclopedia Vol 8', status: 'Requested' },
  { title: 'World Encyclopedia Vol 9', status: 'Requested' },
  { title: 'World Encyclopedia Vol 10', status: 'Requested' },
  { title: 'World Encyclopedia Vol 11', status: 'Requested' },
  { title: 'World Encyclopedia Vol 12', status: 'Requested' },
  { title: 'World Encyclopedia Vol 13', status: 'Requested' },
  { title: 'World Encyclopedia Vol 14', status: 'Requested' },
  { title: 'World Encyclopedia Vol 15', status: 'Requested' },
  { title: 'World Encyclopedia Vol 16', status: 'Requested' },
  { title: 'World Encyclopedia Vol 17', status: 'Requested' },
  { title: 'World Encyclopedia Vol 18', status: 'Requested' },
  { title: 'World Encyclopedia Vol 19', status: 'Requested' }
]

seed_product_data.each do |p|
  Product.where(title: p[:title], status: p[:status]).first_or_create
end
