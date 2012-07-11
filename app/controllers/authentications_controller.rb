class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      # flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, authentication.user)
    elsif current_user
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      # flash[:notice] = "Authentication successful."
      redirect_to authentications_url
    else
      user = User.new
      user.apply_omniauth omniauth
      if user.save
        
        # flash[:notice] = "Signed in successfully."
        sign_in_and_redirect(:user, user)
      else
        session[:omniauth] = omniauth.except('extra')
        if omniauth[:extra][:raw_info][:education].present?
          omniauth[:extra][:raw_info][:education].each do |edu|
            if edu[:type] == "College"
              session[:college] = edu
              break
            end
          end
        else
          session[:college] = nil
        end
        if omniauth[:extra][:raw_info][:birthday].present?
          birthday = omniauth[:extra][:raw_info][:birthday].split('/')
          session[:birthday] = birthday[0]+'-'+birthday[1]+'-'+birthday[2]
        else
          session[:birthday] = nil
        end
        session[:location] = omniauth[:info][:location].present? ? omniauth[:info][:location] : nil
        session[:work] = omniauth[:extra][:raw_info][:work].present? ? omniauth[:extra][:raw_info][:work][0] : nil
        session[:relationship_status] = omniauth[:extra][:raw_info][:relationship_status].present? ? omniauth[:extra][:raw_info][:relationship_status] : nil

        redirect_to new_user_registration_url
      end
    end
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end
end
