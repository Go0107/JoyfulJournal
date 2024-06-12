class JournalsController < ApplicationController
  def index
    @journals = Journal.where(user_id: current_user).order(created_at: :desc)
  end

  def new
  end

  def create
    @journal = Journal.new(content: params[:content], user_id: current_user.id)
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
end
