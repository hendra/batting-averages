require 'csv'

class BattingsController < ApplicationController
  before_action :set_batting, only: %i[ show edit update destroy ]

  # GET /battings or /battings.json
  def index
    # @battings = Batting.where(player_id: 'zuberbi01').group(:player_name, :year_id).select('*, SUM(ab) as total_ab, SUM(h) as total_h').page(params[:page])
    @battings = Batting.group(:player_id, :year_id).select("*, SUM(ab) as total_ab, SUM(h) as total_h, GROUP_CONCAT(team_id, ',') as tid").page(params[:page])
  end

  # GET /battings/1 or /battings/1.json
  def show
  end

  # GET /battings/new
  def new
    @batting = Batting.new
  end

  # GET /battings/1/edit
  def edit
  end

  # POST /battings or /battings.json
  def create
    Batting.in_batches(of: 10000).destroy_all
    csv_text = File.read(params[:attachment].tempfile)
    records = []
    CSV.parse(csv_text, headers: true) do |row|
      records << Batting.new({
        player_id: row[0],
        year_id: row[1].to_i,
        team_id: row[3],
        stint: row[2].to_i,
        ab: row[6].to_i,
        h: row[8].to_i
      })
    end

    Batting.import records
    redirect_to '/battings', notice: "Batting was successfully created."

    # respond_to do |format|
    #   if @batting.save
    #     format.html { redirect_to @batting, notice: "Batting was successfully created." }
    #     format.json { render :show, status: :created, location: @batting }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @batting.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /battings/1 or /battings/1.json
  def update
    respond_to do |format|
      if @batting.update(batting_params)
        format.html { redirect_to @batting, notice: "Batting was successfully updated." }
        format.json { render :show, status: :ok, location: @batting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @batting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /battings/1 or /battings/1.json
  def destroy
    @batting.destroy
    respond_to do |format|
      format.html { redirect_to battings_url, notice: "Batting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batting
      @batting = Batting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def batting_params
      params.require(:batting).permit(:player_id, :year_id)
    end
end
