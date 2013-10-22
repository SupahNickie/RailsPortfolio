class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def create?
    user.present? && (user.author? || user.editor?)
  end

  # or, could do alias_method :update?, :create?

  def update?
    user.present? &&
    ((user.author? && (post.author == user)) ||
    (user.editor?))
  end

  def destroy?
    if user.present?
      return true if user.editor?
      user.id == post.author_id
    end
  end

  def publish?
    user.present? && user.editor?
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.editor?
        scope.all
      elsif user.author?
        # | by itself is a "union" operator
        scope.where(author_id: user.id) | scope.where(published: true)
      else
        scope.where(published: true)
      end
    end
  end

end
