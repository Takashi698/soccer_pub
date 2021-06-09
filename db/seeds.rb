# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Team.create! (
  [
    {name: 'team1'},
    {name: 'team2'},
    {name: 'team3'},
    {name: 'team4'},
    {name: 'team5'},
    {name: 'team6'},
    {name: 'team7'},
    {name: 'team8'},
    {name: 'team9'},
  ]
)

User.create!(name:  "管理者",
             email: "to@admin.com",
             password:  "11111111",
             password_confirmation: "11111111",
             admin: true)

# Game.create! (
#   [
#     {place: 'Tokyo'},
#     {place: 'Osaka'},
#     {place: 'Kyoto'},
#     {place: 'Sendai'},
#     {place: 'Sapporo'},
#     {place: 'Hakata'},
#     {place: 'Hiroshima'},
#     {place: 'Amakusa'},
#   ]
# )
