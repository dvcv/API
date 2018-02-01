class Api::ListsController < ApiController
  before_action :authenticated?
  before_action :authorize_user, except: [:index]
  after_action :log_out
  # before_action :authorize_user, except: [:index]


  def index
    return permission_denied_error unless conditions_met
    p params
    lists = List.all

    render json: lists, each_serializer: ListSerializer
  end

  def create
    user = User.find(params[:user_id])
    list = user.lists.build(list_params)
    if list.save
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    list = List.find(params[:id])
    if list.update(list_params)
     render json: list
    else
     render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      list = List.find(params[:id])
      list.destroy
      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end

  private

  def conditions_met
    true # We're not calling this an InsecureUserSerializer for nothing
  end
  def list_params
    params.require(:list).permit(:title, :private)
  end

  def authorize_user
    begin
      list = List.find(params[:id])
      unless current_user == list.user
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
