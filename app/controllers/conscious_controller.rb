class ConsciousController < ApplicationController
  before_action :set_consciou, only: %i[ show edit update destroy ]

  # GET /conscious or /conscious.json
  def index
    @conscious = Consciou.all
  end

  # GET /conscious/1 or /conscious/1.json
  def show
  end

  # GET /conscious/new
  def new
    @consciou = Consciou.new
  end

  # GET /conscious/1/edit
  def edit
  end

  # POST /conscious or /conscious.json
  def create
    @consciou = Consciou.new(consciou_params)

    respond_to do |format|
      if @consciou.save
        format.html { redirect_to consciou_url(@consciou), notice: "Consciou was successfully created." }
        format.json { render :show, status: :created, location: @consciou }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @consciou.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conscious/1 or /conscious/1.json
  def update
    respond_to do |format|
      if @consciou.update(consciou_params)
        format.html { redirect_to consciou_url(@consciou), notice: "Consciou was successfully updated." }
        format.json { render :show, status: :ok, location: @consciou }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @consciou.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conscious/1 or /conscious/1.json
  def destroy
    @consciou.destroy

    respond_to do |format|
      format.html { redirect_to conscious_url, notice: "Consciou was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consciou
      @consciou = Consciou.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def consciou_params
      params.fetch(:consciou, {})
    end
end
