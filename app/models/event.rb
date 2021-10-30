class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :event_attendances, foreign_key: "attended_event_id", class_name: "EventAttendance"
  has_many :attendees, through: "event_attendances", source: "attendee"
  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 5, maximum: 150}
  validates :location, presence: true
  
  scope :upcoming, -> { where('date >= ?', Time.zone.now) }
  scope :previous, -> { where('date < ?', Time.zone.now) }

end
