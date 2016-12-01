class BookingMailer < ApplicationMailer

  def refund_reponse booking
    @booking = booking
    mail to: @booking.user.email, subject: t("mailer.refund_reponse")
  end

  def approve_reponse booking
    @booking = booking
    mail to: @booking.user.email, subject: t("mailer.approve_reponse")
  end

  def cancel_reponse booking
    @booking = booking
    mail to: @booking.user.email, subject: t("mailer.cancel_reponse")
  end
end
