# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# User

user1 = User.create!(
  name: "Taka",
  email: "test1@example.com",
  password: "password",
  password_confirmation: "password",
  image: File.open("./app/assets/images/icon_images/icon1.jpg"),
  admin: true
)
user2 = User.create!(
  name: "Shun",
  email: "test2@example.com",
  password: "password",
  password_confirmation: "password",
  image: File.open("./app/assets/images/icon_images/icon2.png"),
)
user3 = User.create!(
  name: "Nobu",
  email: "test3@example.com",
  password: "password",
  password_confirmation: "password",
  image: File.open("./app/assets/images/icon_images/icon3.png"),
)
user4 = User.create!(
  name: "Toku",
  email: "test4@example.com",
  password: "password",
  password_confirmation: "password",
  image: File.open("./app/assets/images/icon_images/icon4.png"),
)
user5 = User.create!(
  name: "Kei",
  email: "test5@example.com",
  password: "password",
  password_confirmation: "password",
  image: File.open("./app/assets/images/icon_images/icon5.png"),
)

# Team

team1 = Team.create!(
  name: "バルセルナ",
  image: File.open("./app/assets/images/team_images/image1.png"),
  description: "カタルーニャ州バルセロナをホームタウンとするスペインのサッカークラブ。",
  user_id: user1.id,
)
team2 = Team.create!(
  name: "アトレティコ",
  image: File.open("./app/assets/images/team_images/image2.png"),
  description: "スペインプロリーグ機構に所属するサッカークラブである。",
  user_id: user1.id,
)
team3 = Team.create!(
  name: "セルタ",
  image: File.open("./app/assets/images/team_images/image3.png"),
  description: "スペイン・ガリシア州ポンテベドラ県ビーゴに本拠地を置くサッカークラブ。",
  user_id: user1.id,
)
team4 = Team.create!(
  name: "グラナタ",
  image: File.open("./app/assets/images/team_images/image4.png"),
  description: "スペイン・アンダルシア州グラナダ県グラナダを本拠地とするサッカークラブである。",
  user_id: user1.id,
)
team5 = Team.create!(
  name: "エイバル",
  image: File.open("./app/assets/images/team_images/image5.jpg"),
  description: "バスク州ギプスコア県エイバルを本拠地とするスペインのサッカークラブ。",
  user_id: user1.id,
)


# Game

game1_1 = Game.create!(
  content: "イングランドにとっては因縁の対決。現指揮官のガレス・サウスゲート監督は同試合に選手として出場し、PK戦で6人目のキッカーを務めて唯一の失敗に終わっていた。当時と同じくウェンブリーで25年前の雪辱を果たしたいところ。対するドイツはイングランド撃破後、決勝でチェコに勝利して3度目の優勝を果たした。今大会ではその1996年以来、6大会ぶりの欧州制覇を目指す。",
  place: 'Savilla',
  match_at: Date.parse('Mon, 3 Jun 2020 06:56:25 UTC +00:00'),
  user_id: user4.id,
)
Upshot.create!(
  team_a_id: Team.findRandom.id,
  team_b_id: Team.findRandom.id,
  team_a_point: 5,
  team_b_point: 6,
  game_id: game1_1.id,
)
game1_2 = Game.create!(
  content: "グループFは、2018年ワールドカップ王者のフランス、前回EURO覇者のポルトガル、2014年ワールドカップ王者のドイツが同居する“死の組”だった。グループステージでは、格下と見られえていたハンガリーが健闘したのもあり大混戦となったが、最終的には下馬評通り、フランス、ドイツ、ポルトガルの強豪3チームが決勝トーナメント（ラウンド16）に進出した。",
  place: 'Vigo',
  match_at: Date.parse('Mon, 27 Jun 2020 06:56:25 UTC +00:00'),
  user_id: user2.id,
)
Upshot.create!(
  game_id: game1_2.id,
  team_a_id: Team.findRandom.id,
  team_b_id: Team.findRandom.id,
  team_a_point: 5, 
  team_b_point: 6,
)
game1_3 = Game.create!(
  content: "ジャカは「素晴らしいね。今夜、僕たちは歴史を作った。みんな誇りに思っているよ」とコメント。自身はこの試合で受けたイエローカードにより、7月2日の準々決勝スペイン代表戦は累積警告で出場できないが、「僕らはこの国のサッカーの歴史を作った。準々決勝はスペインだから難しいだろうが、僕たちは今、夢を見ている」と快挙達成の喜びに浸った。",
  place: 'Soria',
  match_at: Date.parse('Mon, 21 Jun 2020 06:56:25 UTC +00:00'),
  user_id: user3.id,
)
Upshot.create!(
  game_id: game1_3.id,
  team_a_id: Team.findRandom.id,
  team_b_id: Team.findRandom.id,
  team_a_point: 5, 
  team_b_point: 6,
)
game1_4 = Game.create!(
  content: "「その質問は理解はできるが、正しいメンタリティではない。対戦相手に安堵していると、よからぬ油断が生まれることはある」
  「私たちはあのロシアW杯で、日本代表にほとんど敗れていたようなものだ。彼らは下馬評では格下だったんだ」
  「私たち次第なんだ。ポルトガルはタフな相手だ。だが、私たちもタフだ」
  ",
  place: 'Victoria',
  match_at: Date.parse('Mon, 15 Jun 2020 06:56:25 UTC +00:00'),
  user_id: user4.id,
)
Upshot.create!(
  game_id: game1_4.id,
  team_a_id: Team.findRandom.id,
  team_b_id: Team.findRandom.id,
  team_a_point: 5, 
  team_b_point: 6,
)
game1_5 = Game.create!(
  content: "今後語り継がれるであろうスーパーゴールが生まれたのは、フランスの1点ビハインドで迎えた後半12分だった。PA内中央へ走るベンゼマにFWキリアン・ムバッペ(パリSG)からラストパスが送られると、やや後ろにずれるが、ベンゼマは残した左足を伸ばし、地面に叩きつけるようなタッチでバウンドさせたボールを自身の背後に通す。そしてGKとの1対1から、2タッチ目で冷静にゴールへ流し込んだ。",
  place: 'Mallorca',
  match_at: Date.parse('Mon, 6 Jun 2020 06:56:25 UTC +00:00'),
  user_id: user5.id
)
Upshot.create!(
  game_id: game1_5.id,
  team_a_id: Team.findRandom.id,
  team_b_id: Team.findRandom.id,
  team_a_point: 5, 
  team_b_point: 6,
)

 # Gameお気に入り
Favorite.create!(
  [
    # user1
    {user_id: user1.id, game_id: game1_1.id},

    # user2
    {user_id: user2.id, game_id: game1_3.id},

    # user3
    {user_id: user3.id, game_id: game1_2.id},

    # user4
    {user_id: user4.id, game_id: game1_5.id},

    # user5
    {user_id: user5.id, game_id: game1_4.id},
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
    {follower_id: user4.id, followed_id: user1.id},

    {follower_id: user5.id, followed_id: user3.id},
    {follower_id: user5.id, followed_id: user4.id},
    {follower_id: user5.id, followed_id: user1.id},

  ]
)
