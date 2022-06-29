class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :html_url, presence: true

  def hash_link
    html_url.split('/').last
  end
end