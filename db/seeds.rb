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

# User.create!(name:  "管理者",
#              email: "to@admin.com",
#              password:  "11111111",
#              password_confirmation: "11111111",
#              admin: true)


# User

user1 = User.create!(
  name: "Taka",
  email: "test1@example.com",
  password: "password",
  password_confirmation: "password",
  image: File.open("./app/assets/images/icon_images/icon1.jpg"),
)
user2 = User.create!(
  name: "Shun",
  email: "test2@example.com",
  password: "password",
  password_confirmation: "password",
  image: File.open("./app/assets/images/icon_images/icon1.jpg"),
)
user3 = User.create!(
  name: "Nobu",
  email: "test3@example.com",
  password: "password",
  password_confirmation: "password",
  image: File.open("./app/assets/images/icon_images/icon1.jpg"),
)
user4 = User.create!(
  name: "Toku",
  email: "test44444@example.com",
  password: "password",
  password_confirmation: "password",
  image: File.open("./app/assets/images/icon_images/icon1.jpg"),
)
user5 = User.create!(
  name: "Kei",
  email: "test5@example.com",
  password: "password",
  password_confirmation: "password",
  image: File.open("./app/assets/images/icon_images/icon1.jpg"),
)

# Game

game1_1 = Game.create!(
  team_a_id: team1_id,
  team_b_id: team2_id,
  team_a_point: 5, 
  team_b_point: 6,
  content: "100歳を迎える岡選手がハットトリックを達成",
  place: 'Osaka',
  match_at: DateTime.new(2021,3,3,3,3),
  user_id: user4.id,
)
game1_2 = Game.create!(
  team_a_id: team3.id,
  team_b_id: team4.id,
  content: "サポーターが全員乱入、試合を一時中断",
  place: 'Tokyo',
  match_at: DateTime.new(2021,3,3,3,3),
  user_id: user2.id,
)
game1_3 = Game.create!(
  team_a_id: team5.id,
  team_b_id: team6.id,
  content: "ハーフタイム中にテロ予告があり、試合に緊張感が走る",
  place: 'Hiroshima',
  match_at: DateTime.new(2021,6,6,6,6),
  user_id: user3.id,
)
game1_4 = Game.create!(
  team_a_id: team3.id,
  team_b_id: team4.id,
  content: "台風急接近により、ゴールが吹っ飛ぶ",
  place: 'Tokyo',
  match_at: DateTime.new(2021,6,6,6,6),
  user_id: user4.id,
)
game1_5 = Game.create!(
  team_a_id: team5.id,
  team_b_id: team6.id,
  content: "試合中にUFOが上空に現れ、試合が中断",
  place: 'Hiroshima',
  match_at: Date.new(2021,6,6,6,6),
  user_id: user5.id,
)

 # Gameお気に入り
 GameFavorite.create!(
  [
    # user1
    {user_id: user1.id, Game_id: game1_1.id},

    # user2
    {user_id: user1.id, Game_id: game1_2.id},

    # user3
    {user_id: user1.id, Game_id: game1_3.id},

    # user4
    {user_id: user1.id, Game_id: game1_4.id},

    # user5
    {user_id: user1.id, Game_id: game1_5.id},
  ]
)


# フォロー/フォロワー
Relationship.create!(
  [
    {follower_id: user1.id, followed_id: user2.id},
    {follower_id: user1.id, followed_id: user3.id},
    {follower_id: user1.id, followed_id: user5.id},

    {follower_id: user2.id, followed_id: user1.id},
    {follower_id: user2.id, followed_id: user4.id},
    {follower_id: user2.id, followed_id: user5.id},

    {follower_id: user3.id, followed_id: user1.id},
    {follower_id: user3.id, followed_id: user2.id},
    {follower_id: user3.id, followed_id: user5.id},
    
    {follower_id: user4.id, followed_id: user3.id},
    {follower_id: user4.id, followed_id: user5.id},
    {follower_id: user4.id, followed_id: user6.id},

    {follower_id: user5.id, followed_id: user3.id},
    {follower_id: user5.id, followed_id: user4.id},
    {follower_id: user5.id, followed_id: user6.id},

    {follower_id: user6.id, followed_id: user3.id},
    {follower_id: user6.id, followed_id: user4.id},
    {follower_id: user6.id, followed_id: user5.id},

  ]
)
