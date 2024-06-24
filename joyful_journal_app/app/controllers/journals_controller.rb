class JournalsController < ApplicationController
  before_action :authenticate_user!

  def index
    @journals = Journal.where(user_id: current_user.id).order(created_at: :desc)
    # キャラクターの処理を書く
    # キャラクターの処理に使う用のデータを取ってくる（今日のデータ）
    # if分で処理を描く
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

end
