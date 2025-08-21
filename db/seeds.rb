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

roles.each do |role, prefix|
  10.times do |n|
    Hero.find_or_create_by!(
      name: "#{prefix}#{n + 1}",
      role: role
    )
  end
end


rank_names = %w[
  ブロンズ
  シルバー
  ゴールド
  プラチナ
  ダイヤモンド
  マスター
  グランドマスター
  トップ500
]

rank_names.each_with_index do |name, i|
  Rank.find_or_create_by!(name: name)
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