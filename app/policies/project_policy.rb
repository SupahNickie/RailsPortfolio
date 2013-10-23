class ProjectPolicy < ApplicationPolicy
  attr_reader :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end

  def create?
    user.present? && (user.author? || user.editor?)
  end

  def update?
    user.present? &&
    ((user.author? && (project.author_id == user.id)) ||
    (user.editor?))
  end

  def destroy?
    if user.present?
      return true if user.editor?
      user.id == project.author_id
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
