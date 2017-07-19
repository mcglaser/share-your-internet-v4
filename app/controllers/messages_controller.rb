class MessagesController < ApplicationController



  def new
  	@message = Message.new
  end





  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to @message
    else
    render 'new'
     end
 end


  def index
  	#@message = message
  end

  def show
  	@message = Message.find(params[:id])
  end


private

  def message_params
    params.require(:message).permit(:user_message, :user_id)
  end


end