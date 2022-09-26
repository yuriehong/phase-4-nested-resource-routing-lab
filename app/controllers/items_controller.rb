class ItemsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response


  def index
    if(params[:user_id])
      user = User.find(params[:user_id])
      items = user.items
    else
      items = Item.all
    end
    render json: items, include: :user
  end

  def render_not_found_response
    render json: { error: "user not found" }, status: :not_found
  end

end
