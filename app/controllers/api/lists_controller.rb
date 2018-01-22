class Api::ListsController < ApiController
  before_action :authenticated?

  def index
    return permission_denied_error unless conditions_met

    lists = List.all

    render json: lists, each_serializer: ListSerializer
  end

  def create
    list = List.new
    list.title = params[:list][:title]
    list.private = params[:list][:private]
    list.user_id = params[:user_id]
  
    if list.save
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end


  private

  def conditions_met
    true # We're not calling this an InsecureUserSerializer for nothing
  end
end
