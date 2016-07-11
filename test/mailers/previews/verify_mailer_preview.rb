# Preview all emails at http://localhost:3000/rails/mailers/verify_mailer
class VerifyMailerPreview < ActionMailer::Preview
	def send_mail_preview
		VerifyMailer.send_mail(User.first)
	end
end
