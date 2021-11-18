class KittensController < ApplicationController
  def index
    kittens = Kitten.all 
    render json: kittens.as_json
  end

  def create
    kitten = Kitten.new(
      name: params[:name],
      breed: params[:breed],
      age: params[:age],
      image: params[:image]
    )
    kitten.save
    render json: kitten.as_json
  end

  def show
    kitten = Kitten.find_by(id: params[:id])
    render json: kitten.as_json
  end
end