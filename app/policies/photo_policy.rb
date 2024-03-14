class PhotoPolicy < ApplicationPolicy
  attr_reader :user, :photo

  def initialize(user, photo)
    @user = user
    @photo = photo
  end

  def new?
    create?
  end

  def create?
    true
  end

  def update?
    is_owner?
  end

  def destroy?
    is_owner?
  end

  # Our policy is that a photo should only be seen by the owner of followers
  # of the owner, unless the owner is not provate in which case anyone can see it
  def show?
    user == photo.owner || !photo.owner.private? || photo.owner.followers.include?(user)
  end

  private

  def is_owner?
    user == photo.owner
  end
end
