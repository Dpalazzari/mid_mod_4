class Api::V1::LinksController < ApplicationController

  def index
    links = current_user.links
    render json: links
  end

  def create
    link = JSON.parse(request.body.read)
    new_link = Link.create(title: link['title'], url: link['url'])
    if new_link
      current_user.links << new_link
      render json: new_link
    else
      render json: new_link.errors.full_messages, status: 400
    end
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      render json: @link
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  private

  def link_params
    params.permit(:read, :create, :update)
  end
end
