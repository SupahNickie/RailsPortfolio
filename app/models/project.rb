class Project < ActiveRecord::Base
  has_many :comments, as: :commentable

  attr_accessible :name, :technologies_used

  validates :technologies_used, presence: true
  validates :name, length: { in: 4..255 }
end
