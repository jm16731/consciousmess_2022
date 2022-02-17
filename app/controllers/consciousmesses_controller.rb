class ConsciousmessesController < ApplicationController
  before_action :set_consciousmess, only: %i[ show edit update destroy ]

  # GET /consciousmesses or /consciousmesses.json
  def index
    @consciousmesses = Consciousmess.all
  end

  # GET /consciousmesses/1 or /consciousmesses/1.json
  def show
  end

  # GET /consciousmesses/new
  def new
    @consciousmess = Consciousmess.new
  end

  # GET /consciousmesses/1/edit
  def edit
  end

  # POST /consciousmesses or /consciousmesses.json
  def create
    @consciousmess = Consciousmess.new(consciousmess_params)

    respond_to do |format|
      if @consciousmess.save
        format.html { redirect_to consciousmess_url(@consciousmess), notice: "Consciousmess was successfully created." }
        format.json { render :show, status: :created, location: @consciousmess }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @consciousmess.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consciousmesses/1 or /consciousmesses/1.json
  def update
    respond_to do |format|
      if @consciousmess.update(consciousmess_params)
        format.html { redirect_to consciousmess_url(@consciousmess), notice: "Consciousmess was successfully updated." }
        format.json { render :show, status: :ok, location: @consciousmess }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @consciousmess.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consciousmesses/1 or /consciousmesses/1.json
  def destroy
    @consciousmess.destroy

    respond_to do |format|
      format.html { redirect_to consciousmesses_url, notice: "Consciousmess was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consciousmess
      @consciousmess = Consciousmess.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def consciousmess_params
      params.fetch(:consciousmess, {})
    end
end
