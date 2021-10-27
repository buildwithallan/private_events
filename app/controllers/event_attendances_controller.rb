class EventAttendancesController < ApplicationController
	
  def create
    @event = Event.find(params[:event_id])
    @attended_event = @event.event_attendances.build(attendee: current_user)
    if @attended_event.save
      redirect_to events_path, notice: 'Thanks for Attending'
    else
      redirect_to events_path, alert: 'You can only attend once'
    end
  end
end
