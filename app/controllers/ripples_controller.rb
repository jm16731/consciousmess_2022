class RipplesController < ApplicationController
  before_action :set_ripple, only: %i[ show edit update destroy ]
  #skip_before_action :redirect_to_homepage, only: [:show, :index, :new, :create]

  # GET /ripples or /ripples.json
  def index
    @ripples = Ripple.all.order(:posted).
      reverse_order.limit(10)
    #@ripples = Ripple.all.order(:posted).
    #  reverse_order.limit(10).offset(params[:offset])
    #@offset = params[:offset]
    #@last_page = (Ripple.count - 10).round(-1, half: :down)
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
    #
  end

  def next_10
    #
  end

  def oldest
    @ripples = Ripple.all.order(:posted).
      reverse_order.limit(10).
      offset((Ripple.count - 10).round(-1, half: :down))
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
