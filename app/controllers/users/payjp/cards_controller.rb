class Users::Payjp::CardsController < Users::Payjp::Base
  def index
    @customer = Payjp::Customer.retrieve(current_user.customer_id)
    @cards = @customer.cards.all
    @plan = Subscription.find(current_user.id).plan_id
  end

  def create
    pj_customer = Payjp::Customer.retrieve(current_user.customer_id)
    pj_card = pj_customer.cards.create(
                card: params["payjp-token"]
              )
    card = current_user.cards.build(
            card_id: pj_card.id,
            number: pj_card.last4,
            brand: pj_card.brand,
            default: true
          )
    card.save!
    pj_card.metadata = {card_id: card.id}
    pj_card.save

    flash[:success] = "カードの登録が完了しました。"
    redirect_to users_cards_url
  rescue Payjp::InvalidRequestError => e
    flash[:danger] = e.message
    redirect_to users_cards_url
  end

  def update
    card = current_user.cards.find(params[:id])
    customer = Payjp::Customer.retrieve(current_user.customer_id)
    customer.default_card = card.card_id
    customer.save
    flash[:success] = "支払いカードを変更しました。"
    redirect_to users_cards_url
    # todo 例外処理
    # rescue
    
  end

  def destroy
    
  end

end
