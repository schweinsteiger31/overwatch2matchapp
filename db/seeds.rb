# 既存のデータを全て削除
puts "既存のテストデータを削除しています..."
UserEndorsement.delete_all
EndorsementTag.delete_all
InteractionLog.delete_all
UserRating.delete_all
Match.delete_all
Like.delete_all
HeroProficiency.delete_all
PlayModel.delete_all
User.delete_all
Hero.delete_all
PlayTime.delete_all
PlayStyle.delete_all
TalkStyle.delete_all
Rank.delete_all
puts "既存データの削除が完了しました。"

# --- マスターデータの作成 ---

puts "ヒーローの初期データを作成します..."
heroes_data = [
  # タンクヒーロー
  { name: "D.Va", role: :tank, icon_url: "hero_image/tank_image/dva_icon.png" },
  { name: "ウィンストン", role: :tank, icon_url: "hero_image/tank_image/winston_icon.png" },
  { name: "オリーサ", role: :tank, icon_url: "hero_image/tank_image/orisa_icon.png" },
  { name: "ザリア", role: :tank, icon_url: "hero_image/tank_image/zarya_icon.png" },
  { name: "シグマ", role: :tank, icon_url: "hero_image/tank_image/sigma_icon.png" },
  { name: "ジャンカー・クイーン", role: :tank, icon_url: "hero_image/tank_image/junker-queen_icon.png" },
  { name: "ドゥームフィスト", role: :tank, icon_url: "hero_image/tank_image/doomfist_icon.png" },
  { name: "マウガ", role: :tank, icon_url: "hero_image/tank_image/mauga_icon.png" },
  { name: "ラインハルト", role: :tank, icon_url: "hero_image/tank_image/reinhardt_icon.png" },
  { name: "ラマットラ", role: :tank, icon_url: "hero_image/tank_image/ramattra_icon.png" },
  { name: "レッキング・ボール", role: :tank, icon_url: "hero_image/tank_image/wrecking-ball_icon.png" },
  { name: "ロードホッグ", role: :tank, icon_url: "hero_image/tank_image/roadhog_icon.png" },
  # ダメージヒーロー
  { name: "アッシュ", role: :damage, icon_url: "hero_image/damage_image/ashe_icon.png" },
  { name: "ウィドウメイカー", role: :damage, icon_url: "hero_image/damage_image/widowmaker_icon.png" },
  { name: "エコー", role: :damage, icon_url: "hero_image/damage_image/echo_icon.png" },
  { name: "キャスディ", role: :damage, icon_url: "hero_image/damage_image/cassidy_icon.png" },
  { name: "ゲンジ", role: :damage, icon_url: "hero_image/damage_image/genji_icon.png" },
  { name: "シンメトラ", role: :damage, icon_url: "hero_image/damage_image/symmetra_icon.png" },
  { name: "ジャンクラット", role: :damage, icon_url: "hero_image/damage_image/junkrat_icon.png" },
  { name: "ソジョーン", role: :damage, icon_url: "hero_image/damage_image/sojourn_icon.png" },
  { name: "ソルジャー76", role: :damage, icon_url: "hero_image/damage_image/soldier-76_icon.png" },
  { name: "ソンブラ", role: :damage, icon_url: "hero_image/damage_image/sombra_icon.png" },
  { name: "トールビョーン", role: :damage, icon_url: "hero_image/damage_image/torbjorn_icon.png" },
  { name: "バスティオン", role: :damage, icon_url: "hero_image/damage_image/bastion_icon.png" },
  { name: "ファラ", role: :damage, icon_url: "hero_image/damage_image/pharah_icon.png" },
  { name: "ベンチャー", role: :damage, icon_url: "hero_image/damage_image/venture_icon.png" },
  { name: "メイ", role: :damage, icon_url: "hero_image/damage_image/mei_icon.png" },
  { name: "リーパー", role: :damage, icon_url: "hero_image/damage_image/reaper_icon.png" },
  # サポートヒーロー
  { name: "アナ", role: :support, icon_url: "hero_image/support_image/ana_icon.png" },
  { name: "イラリー", role: :support, icon_url: "hero_image/support_image/illari_icon.png" },
  { name: "キリコ", role: :support, icon_url: "hero_image/support_image/kiriko_icon.png" },
  { name: "ゼニヤッタ", role: :support, icon_url: "hero_image/support_image/zenyatta_icon.png" },
  { name: "バティスト", role: :support, icon_url: "hero_image/support_image/baptiste_icon.png" },
  { name: "ブリギッテ", role: :support, icon_url: "hero_image/support_image/brigitte_icon.png" },
  { name: "マーシー", role: :support, icon_url: "hero_image/support_image/mercy_icon.png" },
  { name: "モイラ", role: :support, icon_url: "hero_image/support_image/moira_icon.png" },
  { name: "ルシオ", role: :support, icon_url: "hero_image/support_image/lucio_icon.png" },
  { name: "ライフウィーバー", role: :support, icon_url: "hero_image/support_image/lifeweaver_icon.png" },
]
heroes_data.each do |data|
  Hero.find_or_create_by!(name: data[:name]) do |hero|
    hero.role = data[:role]
    hero.icon_url = data[:icon_url]
  end
end
puts "ヒーローの初期データを作成しました！"

# ランク
Rank.tiers.keys.each do |tier|
  Rank.find_or_create_by!(tier: tier)
end

# 評価タグのマスターデータ
puts "評価タグの初期データを作成します..."
EndorsementTag.find_or_create_by!(name: "良い連携", positive: true)
EndorsementTag.find_or_create_by!(name: "的確な報告・コール", positive: true)
EndorsementTag.find_or_create_by!(name: "ポジティブな雰囲気", positive: true)
EndorsementTag.find_or_create_by!(name: "ナイスプレイ！", positive: true)
EndorsementTag.find_or_create_by!(name: "柔軟なヒーローピック", positive: true)
EndorsementTag.find_or_create_by!(name: "暴言・誹謗中傷", positive: false)
EndorsementTag.find_or_create_by!(name: "ゲームの放棄・AFK", positive: false)
EndorsementTag.find_or_create_by!(name: "味方への妨害行為", positive: false)
EndorsementTag.find_or_create_by!(name: "コミュニケーション拒否", positive: false)
puts "評価タグの初期データを作成しました！"

# プレイ時間
%w[daytime night alldays].each { |slot| PlayTime.find_or_create_by!(time_slot: slot) }

# プレイスタイル
%w[enjoy normal strict].each { |style| PlayStyle.find_or_create_by!(style: style) }

# ボイスチャット
%w[yes no].each { |vc| TalkStyle.find_or_create_by!(vc: vc) }

# --- テストユーザーと関連データの作成 ---
require 'faker'

puts "テストユーザーと関連データを作成します..."
users = 10.times.map do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: "password",
    age: rand(18..40),
    gender: [:male, :female].sample,
    discord_id: Faker::Internet.username
  )
end
puts "テストユーザーを10人作成しました。"

# データ取得
play_times = PlayTime.all
play_styles = PlayStyle.all
talk_styles = TalkStyle.all
ranks = Rank.all
heroes = Hero.all

# ユーザーごとにプレイモデルと 習熟度を作成
users.each do |user|
  PlayModel.create!(
    user: user,
    play_time: play_times.sample,
    play_style: play_styles.sample,
    talk_style: talk_styles.sample,
    tank_rank: ranks.sample,
    damage_rank: ranks.sample,
    support_rank: ranks.sample,
    comment: "よろしくお願いします！"
  )

  heroes.each do |hero|
    HeroProficiency.create!(
      user: user,
      hero: hero,
      proficiency_level: rand(0..3)
    )
  end
end
puts "ユーザーと紐づいたプレイ情報・ヒーロー習熟度を作成しました！"

puts "テスト用の「いいね！」と「マッチング」データを作成します..."

user0 = users[0]
user1 = users[1]
user2 = users[2]
user3 = users[3]

Like.create!(sender: user0, receiver: user1)
Like.create!(sender: user0, receiver: user2)
Like.create!(sender: user0, receiver: user3)


Like.create!(sender: user1, receiver: user0)
Like.create!(sender: user2, receiver: user0)

Match.create!(user_one: user0, user_two: user1)
Match.create!(user_one: user0, user_two: user2)

InteractionLog.create!(user: user0, target_user: user1)
InteractionLog.create!(user: user1, target_user: user0)

positive_tags = EndorsementTag.positive.limit(2)
user0.given_endorsements.create!(endorsee: user1, endorsement_tag: positive_tags[0])
user0.given_endorsements.create!(endorsee: user1, endorsement_tag: positive_tags[1])

puts "テスト用のデータを作成しました！"