class MessageController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.where(to_user_id: current_user.id)
    #eager_load(user: :inverse_follows).where(follows: { follower_id: current_user.id})
    writer_id = @messages.map(&:from_user_id).uniq
    @screen_name = Hash[User.where(id: writer_id).map { |user| [user.id, user.screen_name] }]
    @name = Hash[User.where(id: writer_id).map { |user| [user.id, user.name] }]
    @user = User.ransack(params[:q])
    @users = @user.result(distinct: true)
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(tweet_params)
    @message.user = current_user

    respond_to do |format|
      if @message.save
        format.html { redirect_to tweets_url, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        @messages = Messsage.all
        format.html { render :index }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
