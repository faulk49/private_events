class User < ActiveRecord::Base
  before_create :create_remember_token
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { minimum: 1 }
  validates :email, presence: true,
             uniqueness: { case_sensitive: false }


  has_many :events, :foreign_key => :creator_id
  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :attendances



    def attending?(event)
      event.attendees.include?(self)
    end

    def attend!(event)
      self.attendances.create!(attended_event_id: event.id)
    end

    def previous_events
      self.attended_events.where("date < ?", Date.today)
    end


    def upcoming_events
      self.attended_events.where("date > ?", Date.today)
    end






  def User.new_remember_token
      SecureRandom.urlsafe_base64
  end

  def User.digest(token)
      Digest::SHA1.hexdigest(token.to_s)
  end


    private

      def create_remember_token
        self.remember_token = User.digest(User.new_remember_token)
      end


end

