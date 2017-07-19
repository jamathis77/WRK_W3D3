require 'securerandom'

class ShortenedUrl < ActiveRecord::Base
  validates :short_url, presence: true, uniqueness: true
  validates :user_id, :long_url, presence: true

  belongs_to :submitter,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  has_many :visits,
    class_name: :Visit,
    primary_key: :id,
    foreign_key: :shortened_url_id

  has_many(:visitors, through: :visits, source: :visitor)

  def self.random_code
    random_code = SecureRandom.urlsafe_base64(12)
    while ShortenedUrl.exists?(:short_url => random_code)
      random_code = SecureRandom.urlsafe_base64(12)
    end

    random_code
  end

  def self.create_shortened_url(long_url, user)
    ShortenedUrl.create!(short_url: ShortenedUrl.random_code, long_url: long_url, user_id: user.id)
  end
end
