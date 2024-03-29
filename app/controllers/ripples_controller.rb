class RipplesController < ApplicationController
  before_action :set_ripple, only: %i[ show edit update destroy ]
  #skip_before_action :redirect_to_homepage, only: [:show, :index, :new, :create]

  # GET /ripples or /ripples.json
  def index
    session[:offset] = 0
    @ripples = Ripple.all.order(:posted).
      reverse_order.limit(10).offset(session[:offset])
  end

  # GET /ripples/1 or /ripples/1.json
  def show
  end

  # GET /ripples/new
  def new
    @ripple = Ripple.new
  end

  # GET /ripples/1/edit
  def edit
  end

  # POST /ripples or /ripples.json
  def create
    @ripple = Ripple.new(ripple_params)

    respond_to do |format|
      if @ripple.save
        format.html { redirect_to ripples_url,
          notice: "Ripple was successfully created." }
        format.json { render :show, status: :created, location: @ripple }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ripple.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ripples/1 or /ripples/1.json
  def update
    respond_to do |format|
      if @ripple.update(ripple_params)
        format.html { redirect_to ripple_url(@ripple), notice: "Ripple was successfully updated." }
        format.json { render :show, status: :ok, location: @ripple }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ripple.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ripples/1 or /ripples/1.json
  def destroy
    @ripple.destroy

    respond_to do |format|
      format.html { redirect_to ripples_url, notice: "Ripple was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def newest
    redirect_to ripples_url
  end

  def prev_10
    @session = (session[:offset].to_s.to_i - 10)
    if @session <= 10
      redirect_to ripples_url
    else
      session[:offset] = (@session)
      @ripples = Ripple.all.order(:posted).
        reverse_order.limit(10).offset(session[:offset])
      render "index"
    end
  end

  def next_10
    @session = (session[:offset].to_s.to_i + 10)
    if @session >= (Ripple.count - 10).round(-1, half: :down)
      redirect_to oldest_path
    else
      session[:offset] = @session
      @ripples = Ripple.all.order(:posted).
        reverse_order.limit(10).offset(session[:offset])
      render "index"
    end
  end

  def oldest
    session[:offset] = (Ripple.count - 10).round(-1, half: :down)
    @ripples = Ripple.all.order(:posted).
      reverse_order.limit(10).offset(session[:offset])
    render "index"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ripple
      @ripple = Ripple.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ripple_params
      params.require(:ripple).permit(:name, :posted, :message, :url)
    end
end
