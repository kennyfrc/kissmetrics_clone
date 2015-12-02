class RegisteredApplication < ActiveRecord::Base
  validates :url, :url => true

  belongs_to :user
end
