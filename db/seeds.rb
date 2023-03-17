# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([
  {full_name: 'Pavel Nikitin'},
  {full_name: 'Ben McLaren'},
  {full_name: 'Sayinthen Vivekanantham'}
])

projects = Project.create([
  {name: 'RightScale cloud development platform', status: :archived},
  {name: 'AutoHub CRM for Toyota dealer in Moscow', status: :archived},
  {name: 'MomTrusted childcare social network', status: :archived},
  {name: 'Cowboy ebike and commute platform', status: :archived}
])
