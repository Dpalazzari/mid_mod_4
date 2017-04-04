class Api::V1::LinksController < ApplicationController

  def index
    render json: Link.all
  end

  def create
    link = JSON.parse(request.body.read)
    puts "This is the Link: #{link}"
    new_link = Link.create(title: link['title'], url: link['url'])
    render json: new_link
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
    params.permit(:read)
  end
end
