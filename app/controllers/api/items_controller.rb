class Api::ItemsController < ApiController
  before_action :authenticated?

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

  private

  def conditions_met
    true # We're not calling this an InsecureUserSerializer for nothing
  end

  def item_params
    params.require(:item).permit(:title)
  end
end
