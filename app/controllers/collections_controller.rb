class CollectionsController < ApplicationController
  before_action :authorize
  before_action :find_collection, only: %i[show update destroy]

  def index
    @collections = current_user.collections

    render json: @collections
  end

  def show
    render json: @collection
  end

  def create
    @collection = current_user.collections.build(collection_params)

    if @collection.save
      render json: @collection, status: :created
    else
      render json: @collection.errors, status: :unprocessable_entity
    end
  end

  def update
    if @collection.update(collection_params)
      render json: @collection
    else
      render json: @collection.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @collection.destroy
    render json: { message: 'Collection deleted' }, status: :ok
  end

  private

  def find_collection
    @collection = current_user.collections.find_by(id: params[:id])
    render json: { failure: "Collection doesn't exist." }, status: :not_found unless @collection
  end

  def collection_params
    params.permit(:vegatarian_favorites, :meat_lovers, :user_id)
  end
end
