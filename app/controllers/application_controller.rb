class ApplicationController < ActionController::API
  include ActiveSupport::SecurityUtils
  before_action :authenticate_user!

  private

    def authenticate_user!
      if params[:username].present? && params[:usertoken].present?
        user = User.find_by(username: params[:username])
        if user && user.usertoken && secure_compare(user.usertoken, params[:usertoken])
          @current_user = user
          return
        end
      end
      render json: { message: 'Sign in NOT successful, please check credentials.' }, status: :unauthorized
    end
end
