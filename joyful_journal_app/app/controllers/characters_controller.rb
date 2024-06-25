class CharactersController < ApplicationController
  def status
    latest_journal = current_user.journals.order(created_at: :desc).first
    image_path = 'default.png'
    speech = 'こんにちは！'

    if latest_journal.nil? || latest_journal.created_at.to_date != Date.today
      image_path = 'yatsureta.png'
      speech = '最近日記を書いていないね...'
    else
      case latest_journal.happiness_score
      when 5
        image_path = 'fine.png'
        speech = '今日はとても良い日だったね！'
      when 4
        image_path = 'good.png'
        speech = '今日は良い日だったね！'
      when 3
        image_path = 'neutral.png'
        speech = '今日は普通の日だったね。'
      when 2
        image_path = 'unhappy.png'
        speech = '今日はあまり良くなかったね。'
      when 1
        image_path = 'depressed.png'
        speech = '今日はとても悪い日だったね。'
      end
    end

    render json: { image_path: ActionController::Base.helpers.image_path(image_path), speech: speech }
  end
end
