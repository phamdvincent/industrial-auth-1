class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def destroy?
    is_author?
  end

  def edit?
    is_author?
  end

  private

  def is_author?
    user == comment.author
  end
end
