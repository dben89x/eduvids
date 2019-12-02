class QuizAttemptPolicy < ApplicationPolicy
  def current?
    is_owner?
  end

  def show?
    is_owner?
  end
end
