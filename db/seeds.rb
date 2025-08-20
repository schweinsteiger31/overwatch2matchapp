roles = {
  tank: "タンクヒーロー",
  damage: "ダメージヒーロー",
  support: "サポートヒーロー"
}

roles.each do |role, prefix|
  10.times do |n|
    Hero.create!(
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
