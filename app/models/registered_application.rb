class RegisteredApplication < ActiveRecord::Base
  validates :url, :url => true

  belongs_to :user
  has_many :events
end
