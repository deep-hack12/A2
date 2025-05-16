class TamplatesController < ApplicationController
  before_action :set_tamplate, only: %i[ show update destroy ]

  def index
    @tamplate = Tamplate.all
    render json: @tamplate
  end


  def show
    render json: @tamplate
  end


  def create
    @tamplate = Tamplate.new(tamplate_params)
    if @tamplate.save
      render json: @tamplate, status: :created, location: @tamplate
    else
      render json: @tamplate.errors, status: :unprocessable_entity
    end
  end


  def update # It will find article and update the article
    unless @tamplate.update(tamplate_params)
        render json: { errors: errors.full_messages },
               status: :unprocessable_entity
    end
  end

  def destroy # it will find the article and delete it i.e. DELETE operation
    @tamplate = Tamplate.find(params[:id])
    @tamplate.destroy
  end

  private
    def find_tamplate
      @tamplate = Tamplate.find_by_tamplatename!(params[:_tamplatename])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'Tamplate not found' }, status: :not_found
    end

    def tamplate_params
        params.permit(:name, :tamplatename, :email, :password)
    end
end
