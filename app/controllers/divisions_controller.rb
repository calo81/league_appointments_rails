class DivisionsController < ApplicationController
  # GET /divisions
  # GET /divisions.json
  
  #before_action :set_league
  
  def index
    @league = League.find(params[:league_id])
    @divisions = @league.divisions

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @divisions }
    end
  end

  # GET /divisions/1
  # GET /divisions/1.json
  def show
    @division = Division.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @division }
    end
  end

  # GET /divisions/new
  # GET /divisions/new.json
  def new
    @league = League.find(params[:league_id])
    @division = @league.divisions.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @division }
    end
  end

  # GET /divisions/1/edit
  def edit
    @division = Division.find(params[:id])
  end

  # POST /divisions
  # POST /divisions.json
  def create
    @league = League.find(params[:league_id])
    @division = @league.divisions.build(params[:division])

    respond_to do |format|
      if @division.save
        format.html { redirect_to @division.league, notice: 'Division was successfully created.' }
        format.json { render json: @division, status: :created, location: @division }
      else
        format.html { render action: "new" }
        format.json { render json: @division.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /divisions/1
  # PUT /divisions/1.json
  def update
    @division = Division.find(params[:id])
    @division.players << Player.find(params[:player_id]) if params[:player_id]

    respond_to do |format|
      if @division.update_attributes(params[:division])
        format.html { redirect_to @division, notice: 'Division was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @division.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /divisions/1
  # DELETE /divisions/1.json
  def destroy
    @division = Division.find(params[:id])
    @division.destroy

    respond_to do |format|
      format.html { redirect_to league_divisions_url(params[:league_id]) }
      format.json { head :no_content }
    end
  end
  
  private
  
  def set_league
    @league = League.find(params[:league_id])
  end
end
