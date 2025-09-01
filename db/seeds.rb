FavoriteHero.delete_all
PlayModel.delete_all
User.delete_all
Hero.delete_all
PlayTime.delete_all
PlayStyle.delete_all
TalkStyle.delete_all
Rank.delete_all

roles = {
  tank: "タンクヒーロー",
  damage: "ダメージヒーロー",
  support: "サポートヒーロー"
}

#ヒーローのマスターデータ
puts "ヒーローの初期データを作成します..."

heroes_data = [
  #タンクヒーロー
  { name: "D.Va",       role: :tank,    icon_url: "hero_image/tank_image/dva_icon.png" },#1
  { name: "ウィンストン",   role: :tank,    icon_url: "hero_image/tank_image/winston_icon.png" },#2
  { name: "オリーサ",       role: :tank,    icon_url: "hero_image/tank_image/orisa_icon.png" },#3
  { name: "ザリア",       role: :tank,    icon_url: "hero_image/tank_image/zarya_icon.png" },#4
  { name: "シグマ",       role: :tank,    icon_url: "hero_image/tank_image/sigma_icon.png" },#5
  { name: "ジャンカークイーン",       role: :tank,    icon_url: "hero_image/tank_image/junker-queen_icon.png" },#6
  { name: "ドゥームフィスト",       role: :tank,    icon_url: "hero_image/tank_image/doomfist_icon.png" },#7
  { name: "ハザード",       role: :tank,    icon_url: "hero_image/tank_image/hazard_icon.png" },#8
  { name: "マウガ",       role: :tank,    icon_url: "hero_image/tank_image/mauga_icon.png" },#9
  { name: "ラインハルト",       role: :tank,    icon_url: "hero_image/tank_image/einhardt_icon.png" },#10
  { name: "ラマットラ",       role: :tank,    icon_url: "hero_image/tank_image/amattra_icon.png" },#11
  { name: "レッキングボール",       role: :tank,    icon_url: "hero_image/tank_image/wrecking-ball_icon.png" },#12
  { name: "ロードホッグ",       role: :tank,    icon_url: "hero_image/tank_image/roadhog_icon.png" },#13

  #ダメージヒーロー
  { name: "アッシュ",       role: :damage,    icon_url: "hero_image/damage_image/ash_icon.png" },#1
  { name: "ウィドウメイカー",       role: :damage,    icon_url: "hero_image/damage_image/widowmaker_icon.png" },#2
  { name: "エコー",       role: :damage,    icon_url: "hero_image/damage_image/echo_icon.png" },#3
  { name: "キャスディ",       role: :damage,    icon_url: "hero_image/damage_image/cassidy_icon.png" },#4  
  { name: "ゲンジ",       role: :damage,    icon_url: "hero_image/damage_image/genji_icon.png" },#5  
  { name: "シンメトラ",       role: :damage,    icon_url: "hero_image/damage_image/symmetra_icon.png" },#6  
  { name: "ジャンクラット",       role: :damage,    icon_url: "hero_image/damage_image/junkrat_icon.png" },#7
  { name: "ソジョーン",       role: :damage,    icon_url: "hero_image/damage_image/sojourn_icon.png" },#8
  { name: "ソルジャー76",       role: :damage,    icon_url: "hero_image/damage_image/solder-76_icon.png" },#9
  { name: "ソンブラ",       role: :damage,    icon_url: "hero_image/damage_image/sombra_icon.png" },#10
  { name: "トールビョーン",       role: :damage,    icon_url: "hero_image/damage_image/torbjorn_icon.png" },#11
  { name: "バスティオン",       role: :damage,    icon_url: "hero_image/damage_image/bastion_icon.png" },#12
  { name: "ファラ",       role: :damage,    icon_url: "hero_image/damage_image/phara_icon.png" },#13
  { name: "フレイヤ",       role: :damage,    icon_url: "hero_image/damage_image/freja_icon.png" },#14
  { name: "ベンチャー",       role: :damage,    icon_url: "hero_image/damage_image/venture_icon.png" },#15
  { name: "メイ",       role: :damage,    icon_url: "hero_image/damage_image/mei_icon.png" },#16
  { name: "リーパー",       role: :damage,    icon_url: "hero_image/damage_image/reaper_icon.png" },#17 

  #サポートヒーロー
  { name: "アナ",       role: :support,    icon_url: "hero_image/support_image/ana_icon.png" },#1
  { name: "イラリー",       role: :support,    icon_url: "hero_image/support_image/illari_icon.png" },#2
  { name: "ウーヤン",       role: :support,    icon_url: "hero_image/support_image/wuyang_icon.png" },#3
  { name: "キリコ",       role: :support,    icon_url: "hero_image/support_image/kiriko_icon.png" },#4
  { name: "ジュノ",       role: :support,    icon_url: "hero_image/support_image/juno_icon.png" },#5
  { name: "ゼニヤッタ",       role: :support,    icon_url: "hero_image/support_image/zenyatta_icon.png" },#6
  { name: "バティスト",       role: :support,    icon_url: "hero_image/support_image/baptiste_icon.png" },#7
  { name: "ブリギッテ",       role: :support,    icon_url: "hero_image/support_image/brigitte_icon.png" },#8
  { name: "マーシー",       role: :support,    icon_url: "hero_image/support_image/mercy_icon.png" },#9
  { name: "モイラ",       role: :support,    icon_url: "hero_image/support_image/moira_icon.png" },#10
  { name: "ルシオ",       role: :support,    icon_url: "hero_image/support_image/lucio_icon.png" },#11
  { name: "ライフウィーバー",       role: :support,    icon_url: "hero_image/support_image/lifeweaver_icon.png" },#12
  
]

heroes_data.each do |hero_data|
  Hero.find_or_create_by!(hero_data)
end

puts "ヒーローの初期データを作成しました！"


roles.each do |role, prefix|
  10.times do |n|
    Hero.find_or_create_by!(
      name: "#{prefix}#{n + 1}",
      role: role
    )
  end
end


Rank.tiers.keys.each do |tier|
  Rank.find_or_create_by!(tier: tier)
end

require 'faker'

10.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,  # ← 重複しないランダムなメール
    password: "password",
    age: rand(18..40),
    gender: [ :male, :female ].sample
  )
end

%w[daytime night alldays].each do |slot|
  PlayTime.find_or_create_by!(time_slot: slot)
end

# PlayStyleの登録
%w[enjoy normal strict].each do |style|
  PlayStyle.find_or_create_by!(style: style)
end

# TalkStyleの登録
%w[yes no].each do |vc|
  TalkStyle.find_or_create_by!(vc: vc)
end

# 各モデルのデータを取得（←ここでようやく安全に取得できる）
play_times = PlayTime.all
play_styles = PlayStyle.all
talk_styles = TalkStyle.all
ranks = Rank.all
users = User.all

# PlayModelを作成
users.each do |user|
  play_model = PlayModel.create!(
    user: user,
    play_time: play_times.sample,
    play_style: play_styles.sample,
    talk_style: talk_styles.sample,
    tank_rank: ranks.sample,
    damage_rank: ranks.sample,
    support_rank: ranks.sample,
  )

  Hero.order("RANDOM()").limit(6).each do |hero|
    FavoriteHero.create!(
      play_model: play_model,
      hero: hero
    )
  end
end