class JournalsController < ApplicationController
  before_action :authenticate_user!

  def index
    @journals = Journal.where(user_id: current_user.id).order(created_at: :desc)
    @happiness_data = @journals.group_by { |journal| journal.created_at.to_date }
                               .transform_values { |journals| journals.map(&:happiness_score).sum / journals.size.to_f }

    # セリフの定義
    fine_speeches = [
      "今日はとっても幸せだよ！",
      "最高の一日だね！",
      "笑顔が止まらないよ！"
    ]

    good_speeches = [
      "今日はいい気分！",
      "充実した一日だよ。",
      "楽しい時間を過ごせたね！"
    ]

    neutral_speeches = [
      "まあまあかな。",
      "普通の日だね。",
      "特に変わりない一日。"
    ]

    unhappy_speeches = [
      "今日はちょっと元気がないな…。頑張って！",
      "少し寂しい気分だけど、明日はきっと良くなるよ。",
      "今日はあまり良くないけど、大丈夫、明日は新しい一日だよ。"
    ]

    depressed_speeches = [
      "今日はとても悲しいけど、大丈夫、明日は新しい一日だよ。",
      "何もかもがうまくいかない感じだけど、頑張ろう。",
      "本当に辛い一日だけど、明日は良くなると信じて。"
    ]

    no_entry_speeches = [
      "日記を書いてね！",
      "今日はどんな日だった？",
      "あなたの日記を待っているよ！"
    ]

    # キャラクターの状態を決定
    today = Date.today
    if @happiness_data.key?(today)
      average_happiness = @happiness_data[today]
      if average_happiness > 4
        @character_expression = "fine"
        @character_speech = fine_speeches.sample
      elsif average_happiness > 3
        @character_expression = "good"
        @character_speech = good_speeches.sample
      elsif average_happiness > 2
        @character_expression = "neutral"
        @character_speech = neutral_speeches.sample
      elsif average_happiness > 1
        @character_expression = "unhappy"
        @character_speech = unhappy_speeches.sample
      else
        @character_expression = "depressed"
        @character_speech = depressed_speeches.sample
      end
    else
      @character_expression = "no_entry"
      @character_speech = no_entry_speeches.sample
    end
  end

  def chart
    c_journals = current_user.journals
    @happiness_data = c_journals.group_by { |journal| journal.created_at.to_date }
                              .transform_values { |journals| journals.map(&:happiness_score).sum / journals.size.to_f }
  end

  def new
    @journal = Journal.new
  end

  def create
    @journal = Journal.new(
      content: params[:content], 
      user_id: current_user.id,
      stamp: params[:stamp],
    )
    if @journal.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/journals")
    else
      render("/journals/new")
    end
  end

  def show
    @journal = Journal.find_by(id: params[:id])
  end

  def destroy
    @journal = current_user.journals.find(params[:id])
    @journal.destroy
    flash[:notice] = "削除しました"
    redirect_to journals_path
  end

  # private

  # def set_character_state
  #   today_journals = current_user.journals.where(created_at: Time.zone.today.all_day)
    
  #   if today_journals.exists?
  #     total_happiness = today_journals.sum(:happiness_score)
  #     avg_happiness = total_happiness / today_journals.size.to_f

  #     if avg_happiness > 4
  #       @character_image = 'fine.png'
  #       @character_message = '今日はとても幸せな一日だったね！'
  #     elsif avg_happiness > 2
  #       @character_image = 'neutral.png'
  #       @character_message = '今日は普通の日だったね。'
  #     else
  #       @character_image = 'unhappy.png'
  #       @character_message = '今日はあまり良い日ではなかったみたい。'
  #     end
  #   else
  #     @character_image = 'depressed.png'
  #     @character_message = '今日はまだ日記が書かれていないよ。'
  #   end
  # end

end
