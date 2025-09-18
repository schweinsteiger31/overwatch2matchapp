class MatchingScoreCalculator

  def initialize(user_a, user_b)
    @user_a = user_a
    @user_b = user_b

    # 処理を高速化するため、2人のヒーロー習熟度を最初に一度だけ取得し、
    # ヒーローIDですぐに検索できるハッシュ形式に変換しておく
    @proficiencies_a = @user_a.hero_proficiencies.index_by(&:hero_id)
    @proficiencies_b = @user_b.hero_proficiencies.index_by(&:hero_id)
  end

  def self.call(user_a, user_b)
    new(user_a, user_b).execute
  end

  def execute
    hero_synergy_score
  end

  private

  #ヒーローのシナジースコア計算メソッド
  def hero_synergy_score
    total_score = 0

    
    synergy_scores = {
      %w[expert unable_to_play]     => 60,  # 大得意 ⇔ 不可
      %w[proficient unable_to_play] => 50,  # 得意   ⇔ 不可
      %w[expert weak]               => 40,  # 大得意 ⇔ 不得意
      %w[proficient weak]           => 30,  # 得意   ⇔ 不得意

      %w[expert proficient]         => 10,  # 大得意 ⇔ 得意
      %w[expert weak]               => 30,  # 大得意 ⇔ 不得意
      %w[proficient weak]           => 40,  # 得意   ⇔ 不得意
      
      %w[expert expert]             => 5,
      %w[proficient proficient]     => 20,
      %w[weak weak]                 => -10,
      %w[unable_to_play unable_to_play] => -100,

      %w[unable_to_play weak]       => -30
    }

    
    Hero.pluck(:id).each do |hero_id|
      level_a = @proficiencies_a[hero_id]&.proficiency_level || "proficient"
      level_b = @proficiencies_b[hero_id]&.proficiency_level || "proficient"


      key = [level_a, level_b].sort
      
      score = synergy_scores[key] || 0
      total_score += score
    end

    total_score
  end
end

