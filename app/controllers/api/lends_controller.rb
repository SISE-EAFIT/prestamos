class Api::LendsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_lend, only: [:show, :edit, :update, :destroy]

  # GET /lends
  # GET /lends.json
  def index
    @lends = Lend.all
    render json: @lends
  end

  # GET /lends/1
  # GET /lends/1.json
  def show
  end

  # GET /lends/new
  def new
    @lend = Lend.new
  end

  # GET /lends/1/edit
  def edit
  end

  # POST /lends
  # POST /lends.json
  def create
    @lend = Lend.new(lend_params)
    if @lend.save
       render json: @lend, status: :created
    else
       render json: @lend.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lends/1
  # PATCH/PUT /lends/1.json
  def update
    if @lend.update(lend_params)
      render json: @lend, status: :ok
    else
       render json: @lend.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lends/1
  # DELETE /lends/1.json
  def destroy
    @lend.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lend
      @lend = Lend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lend_params
      params.require(:lend).permit(:date, :quantity, :student_id, :element_id)
    end
end
