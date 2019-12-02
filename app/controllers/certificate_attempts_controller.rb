class CertificateAttemptsController < ApplicationController
  def show
    @certificate_attempt = authorize current_attempt
    @certificate_attempt.update_status
  end

  def new
    if current_user.certificate_attempts.create
      redirect_to '/videos'
    end
  end
end
