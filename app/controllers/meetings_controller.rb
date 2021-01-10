class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :destroy]

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.all
  end

  # GET /meetings/1
  def show
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
  end


  # POST /meetings
  def create
    @meeting = Meeting.new(meeting_params)

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to @meeting, notice: 'Meeting was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  # DELETE /meetings/1
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Meeting was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meeting_params
      params.require(:meeting).permit(:user_id, :room_id, :title, :description, :start_time)
    end
end