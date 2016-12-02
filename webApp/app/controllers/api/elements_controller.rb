class Api::ElementsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_element, only: [:show, :edit, :update, :destroy]

  # GET /elements
  # GET /elements.json
  def index
    @elements = Element.all
    render json: @elements
  end

  # GET /elements/1
  # GET /elements/1.json
  def show
  end

  # GET /elements/new
  def new
    @element = Element.new
  end

  # GET /elements/1/edit
  def edit
  end

  # POST /elements
  # POST /elements.json
  def create
    @element = Element.new(element_params)

    if @element.save
      render json: @element, status: :created
    else
      render json: @element.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /elements/1
  # PATCH/PUT /elements/1.json
  def update
    if @element.update(element_params)
       render json: @element, status: :ok
    else
      render json: @element.errors, status: :unprocessable_entity
    end
  end

  # DELETE /elements/1
  # DELETE /elements/1.json
  def destroy
    @element.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_element
      @element = Element.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def element_params
      params.require(:element).permit(:id, :name, :description, :loaned)
    end
end
