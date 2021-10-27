class UsersController < ApplicationController
  def show
    @created_events = current_user.created_events
    @upcoming_events = current_user.attended_events.upcoming
    @prev_events = current_user.attended_events.previous
  end



end
