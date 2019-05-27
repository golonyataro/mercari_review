class UsersController < ApplicationController
  
  def create
    credit = Credit.create(credit_params)
    redirect_to("/")
  end

  def show
    @user = User.find(current_user.id)
  end

  def logout_page
    @user = User.find(params[:id])
  end

  def new_select
  end

  def profile
    @user = User.find(params[:id])
  end

  def identification
    @user = User.find(params[:id])
  end

  def card
    @user = User.find(params[:id])
    card = Credit.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "card_create" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def card_create
    @user = User.find(current_user.id)
  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "card_create"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token']
      )
      @card = Credit.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to "/users/card"
      else
        redirect_to action: "pay"
      end
    end
  end

  def card_delete
    card = Credit.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to "/users/card"
  end

end