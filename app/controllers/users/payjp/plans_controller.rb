
class Users::Payjp::PlansController < Users::Payjp::Base
  def choice
  end

  def new_card
    if current_user.customer_id
      customer = Payjp::Customer.retrieve(current_user.customer_id)
      @cards = customer.cards.all
    end
  end

  def confirm
  end

  def upgrade
    plan = Plan.first
    # 既存のカードでの決済のパターン
    if params[:commit] == "選択されたカードで決済をする"
      card = Card.find(params[:card_id])
      pj_customer = Payjp::Customer.retrieve(current_user.customer_id)
      pj_customer.default_card = card.card_id
      pj_customer.save
    else
      # １customer 登録
      if current_user.customer_id
        pj_customer = Payjp::Customer.retrieve(current_user.customer_id)
      else
        pj_customer = Payjp::Customer.create(
                  description: 'test',
                  metadata: {
                    name: current_user.name,
                    gender: current_user.gender,
                    birthday: current_user.birthday,
                    address: current_user.address,
                    email: current_user.email
                  }
                )
        # ２１のレスポンスのcustomer_idをusersテーブルに保存
        current_user.update!(customer_id: pj_customer.id)
      end
      # 3 customerにcardを新規に作成する
      pj_card = pj_customer.cards.create(
              card: params["payjp-token"],
              default: true
            )
      # 4 3のレスポンスをcardsテーブルに保存
      card = current_user.cards.build(
              card_id: pj_card.id,
              number: pj_card.last4,
              brand: pj_card.brand,
              default: true
            )
      card.save!
      pj_card.metadata = {card_id: card.id}
      pj_card.save
    end
    
    
    # 5 subscriptsionを作成
    pj_subscription = Payjp::Subscription.create(
                    plan: plan.plan_id,
                    customer: pj_customer.id
                  )
    # 6 5のレスポンスをsubscriptionsテーブルに保存
    plan.subscriptions.create!(user_id: current_user.id, subscription_id: pj_subscription.id)

    flash[:success] = "プラン登録処理が完了しました。"
    redirect_to users_cards_url
  rescue Payjp::InvalidRequestError => e
    flash[:danger] = e.message
    redirect_to users_plans_choice_url
  end

  # def complete
  # end
end