class AuthenticationsController < ApplicationController
  skip_before_action :authenticate_user!

	def mail
		@uid = params[:uid]
		@sid = hash( @uid )
		@user = User.find( @uid )
  		VerifyMailer.send_mail( @user, @sid ).deliver
  		redirect_to '/'
        flash[:notice] = 'Email has been sent.' 
  	end

  	def verify
  		@sid = params[:sid]
  		#@auth = Authentication.find( getUID( @sid ) )
  		#@auth.status = :pass
  	end

	private
  	def hash( rawID )
  		return rawID.to_i + 100
  	end

  	def getUID( hashCode )
  		return hashCode.to_i - 100
  	end
end
