class ApplicationMailer < ActionMailer::Base
  default from: "application@cooprs.herokuapp.com"
  layout 'mailer'
end
