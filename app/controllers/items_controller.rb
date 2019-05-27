class ItemsController < ApplicationController

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    if user_signed_in?
      @item = Item.new
      @category = Category.new
      @bland = Bland.new
    else
      redirect_to(new_user_session_path)
    end
  end

  def create
    category = Category.create(category_params)
    bland = Bland.create(bland_params)
    exhibitor = Exhibitor.create(exhibitor_params)
    unless params[:item][:image] == nil ||  params[:item][:name] == nil || params[:item][:price] == nil || params[:item][:explain] == nil || params[:item][:status] == "---" || params[:item][:shipping_which] == "---" || params[:item][:shipping_region] == "---" || params[:item][:shipping_method] == "---" || params[:item][:shipping_day] == "---"
      item_params = params.require(:item).permit(:image, :name, :explain, :status, :price, :shipping_which, :shipping_region, :shipping_method, :shipping_day).merge(exhibitor_id: exhibitor.id, category_id: category.id, bland_id: bland.id, buyer_id: 0)
      item = Item.create(item_params)
      redirect_to(root_path)
    else
      flash[:notice] = '値を正しく入力してください'
      redirect_to(new_item_path)
    end
  end

  def show
    @item = Item.find(params[:id])
    @user = @item.exhibitor.user
    @category = @item.category
    @bland = @item.bland
    
    @number = params[:number]
  end

  def edit
    @item = Item.find(params[:id])
    @category = Category.find(@item.category.id)
    @bland = Bland.find(@item.bland.id)
  end

  def update
    item = Item.find(params[:id])
    category = Category.find(item.category.id)
    bland = Bland.find(item.bland.id)
    user = item.exhibitor.user
    item_params = params.require(:item).permit(:image, :name, :explain, :status, :price, :shipping_which, :shipping_region, :shipping_method, :shipping_day)
    if user.id == current_user.id
      item.update(item_params)
    end
    redirect_to(root_path)
  end

  def destroy
    item = Item.find(params[:id])
    user = item.exhibitor.user
    if user.id == current_user.id
      item.destroy
    end
    redirect_to(root_path)
  end

  def purchase
    @item = Item.find(params[:id])
    @user = @item.exhibitor.user

    card = Credit.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "card", action: "card_create"
    else
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def purchace_patch
    @item = Item.find(params[:id])
    Buyer.create(user_id: current_user.id)
    @item.buyer_id = current_user.id
    @item.save

    card = Credit.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
    amount: @item.price,
    customer: card.customer_id,
    currency: 'jpy',
    )
    redirect_to(root_path)
  end

  def search
    @items = Item.all.order(created_at: :desc)
  end

  def random_page
  end

  def random
    @rand = rand(1..100)
    id = Item.where(buyer_id: 0).ids
    number = Item.where(buyer_id: 0).count
    @random = id[rand(number)]
  end

  private

  def category_params
    params.require(:category).permit(:category_large, :category_medium, :category_small, :category_size)
  end

  def bland_params
    params.require(:bland).permit(:bland_name)
  end

  def exhibitor_params
    params.require(:item).permit().merge(user_id: current_user.id)
  end
  
end