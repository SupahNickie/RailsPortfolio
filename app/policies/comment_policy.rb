class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def create?
    user.present?
  end

  def update?
    user.present? && (user.editor? ||
    (user.author? && comment.commentable.author_id == user.id))
  end

  def destroy?
    user.present? && (user.editor? ||
    (user.author? && comment.commentable.author_id == user.id))
  end

  def approve?
    user.present? && (user.editor? ||
    (user.author? && comment.commentable.author_id == user.id))
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.editor?
        scope.all
      else
        scope.where(approved: true)
      end
    end
  end

end
