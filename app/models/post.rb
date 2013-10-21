class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  attr_accessible :content, :title, :published
  scope :published, where(published: true)

  #def self.published
  #  where(published: true)
  #end

  #def publish
  #  self.published = true
  #  save!
  #end

end
