class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true

  attr_accessible :approved, :author, :author_email, :author_url, :content,
                  :referrer, :user_agent, :user_ip, :commentable_id, :commentable_type, :user_id

  scope :approved, where(approved: true)

  validates :content,      presence: true
  validates :author_email, presence: true
  validates :author,       presence: true
end
