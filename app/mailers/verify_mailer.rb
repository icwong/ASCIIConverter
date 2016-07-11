class VerifyMailer < ApplicationMailer
	default from: "noreply@cooprs.herokuapp.com"

	def send_mail( receiver, sid )
		@user = receiver
		@sid = sid
		mail(to: @user.email, subject: 'Verify link')
	end
end
