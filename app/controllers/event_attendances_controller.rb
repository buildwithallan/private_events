class EventAttendancesController < ApplicationController
	
  def create
    @event = Event.find(params[:event_id])
    @attended_event = @event.event_attendances.build(attendee: current_user)
    if @attended_event.save
      redirect_to events_path, notice: "You are attending #{@event.name}"
    else
      redirect_to events_path, alert: 'You are already attending the event'
    end
  end


   def destroy
    @event = Event.find(params[:id])
    @event.attendees.delete(current_user)
    redirect_to @event, notice: 'You are no longer attending this event'
  end
end
