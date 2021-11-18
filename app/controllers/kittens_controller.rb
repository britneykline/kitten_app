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

  def update
    kitten = Kitten.find_by(id: params[:id])
    kitten.name = params[:name] || kitten.name
    kitten.breed = params[:breed] || kitten.breed
    kitten.age = params[:age] || kitten.age
    kitten.image = params[:image] || kitten.image
    kitten.save
    render json: kitten.as_json
  end

  def destroy
    kitten = Kitten.find_by(id: params[:id])
    kitten.destroy
    render json: {message: "Kitten successfully destroyed."}
  end
end