class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def index?
    true
  end

  def feed?
    true
  end

  def liked?
    true
  end

  def discover?
    true
  end

  def show_user_feed?
    @user == current_user || !user.private? || user.followers.include?(current_user)
  end
  
  def show?
    true
  end
end
