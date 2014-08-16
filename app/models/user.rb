class User < ActiveRecord::Base
  before_create :create_remember_token

  validates :name, presence: true, length: { minimum: 1 }

  has_many :events, :foreign_key => :creator_id
  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :attendances



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

