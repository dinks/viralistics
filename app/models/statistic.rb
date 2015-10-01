require "validators/url_validator"

class Statistic < ActiveRecord::Base
  extend FriendlyId

  friendly_id :name, use: :slugged

  validates :name, presence: true
  validates :url, presence: true, url: true

  before_create :update_statistics

  private

  def update_statistics
    self.facebook = SocialShares.facebook self.url
    self.google = SocialShares.google self.url
    self.twitter = SocialShares.twitter self.url
    self.reddit = SocialShares.reddit self.url
    self.linkedin = SocialShares.linkedin self.url
    self.pinterest = SocialShares.pinterest self.url
    self.stumbleupon = SocialShares.stumbleupon self.url
  rescue => e
    Rails.logger.debug e

    false
  end
end
