class MessageCardsController < ApplicationController
  def create
    user_sent_to = User.find_by(id: params[:message_card][:user_id])
    if user_sent_to
      message_card = user_sent_to.message_cards.build(card_params)
      if message_card.save
        user_sent_to.send_card_by_email
        flash[:success] = "カードを送りました！"
        redirect_to root_url
      else
        flash[:error] = "カードの送信に失敗しました"
        render 'users/show'
      end
    else
      flash[:error] = "存在しないユーザーです"
      redirect_to root_url
    end
  end
  
  private
    def card_params
      params.require(:message_card).permit(:content)
    end
end