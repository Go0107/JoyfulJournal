class JournalsController < ApplicationController
  def index
    @journals = Journal.all
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
end
