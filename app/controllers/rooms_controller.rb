class RoomsController < ApplicationController
  before_action :set_room, only: %i[show destroy]

  # GET /rooms
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  def show; end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # POST /rooms
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # DELETE /rooms/1
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room = Room.includes(:meetings).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def room_params
    params.require(:room).permit(:number)
  end
end
