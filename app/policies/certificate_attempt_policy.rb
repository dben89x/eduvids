class CertificateAttemptPolicy < ApplicationPolicy
  def show?
    is_owner?
  end
end
