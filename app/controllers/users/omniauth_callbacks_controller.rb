class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # See https://github.com/omniauth/omniauth/wiki/FAQ#rails-session-is-clobbered-after-callback-on-developer-strategy
    skip_before_action :verify_authenticity_token, only: :facebook

    def facebook
        @user = User.from_omniauth(request.env["omniauth.auth"])

        if user_signed_in?
            flash[:notice] = "Your Facebook account was connected."
            redirect_to edit_user_registration_path
        else
            sign_in_and_redirect @user, event: :authentication
            set_flash_message :notice, :success, kind: "Facebook"
        end
    end

    def failure
        redirect_to root_path
    end
end
