class JournalsController < ApplicationController
  before_action :authenticate_user!

  def index
    @journals = Journal.where(user_id: current_user.id).order(created_at: :desc)
  end

  def chart
    journals = current_user.journals
    @happiness_data = journals.group_by { |journal| journal.created_at.to_date }
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

end
