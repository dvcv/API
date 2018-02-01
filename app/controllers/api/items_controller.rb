class Api::ItemsController < ApiController
  before_action :authenticated?
  before_action :authorize_user, except: [:index]
  after_action :log_out


  def index
    return permission_denied_error unless conditions_met

    items = Item.all

    render json: items, each_serializer: ItemSerializer
  end

  def create
    list = List.find(params[:list_id])
    item = list.items.build(item_params)
    if item.save
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
     render json: item
    else
     render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def conditions_met
    true # We're not calling this an InsecureUserSerializer for nothing
  end

  def item_params
    params.require(:item).permit(:title, :complete)
  end

  def authorize_user
    begin
      item = Item.find(params[:id])
      unless current_user == item.list.user
        render json: { error: "Make sure you are entering correct information." }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: "#{e}" }, status: :unprocessable_entity
    end
  end

  def log_out
    destroy_session
  end
end
