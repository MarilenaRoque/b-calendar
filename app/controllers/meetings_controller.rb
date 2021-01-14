class MeetingsController < ApplicationController
  before_action :set_meeting, only: %i[show destroy]

  # GET /meetings/1
  def show; end

  # GET /meetings/new
  def new
    @new_meeting_info = new_params
    @meeting = Meeting.new
  end

  # POST /meetings
  def create
    saved = true
    if params[:meeting][:times_list]
      params[:meeting][:times_list].each do |time|
        @meeting = Meeting.new(meeting_params)
        @meeting.start_time = @meeting.start_time.change(hour: time)
        @meeting.hour_start = @meeting.start_time.hour
        saved = false unless @meeting.save
      end
    else
      saved = false
    end
    respond_to do |format|
      if saved
        format.html { redirect_to "/rooms/#{@meeting.room_id}", notice: 'Meeting was successfully created.' }
      else
        format.html { redirect_to "/rooms/#{params[:meeting][:room_id]}", notice: @meeting ? @meeting.errors.full_messages : 'No time period defined' }
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
  def new_params
    params.require(:info).permit(:room_id, :date, availables: [])
  end

  def meeting_params
    params.require(:meeting).permit(:user_id, :room_id, :title, :description, :start_time, :times_list)
  end
end
