class Event < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :attendees, through: :attendances
  has_many :attendances, foreign_key: :attended_event_id

  scope :upcoming , -> { where("date > ?", Date.today)
  }

  scope :past, -> { where("date < ?", Date.today)
  }

  validates :description, presence: true, length: { minimum: 5  }





end
