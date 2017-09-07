# Controller for home routes
class HomeController < ApplicationController
  def index
    return invalid_request if params[:word].blank? || params[:year].blank?

    res = Omdbapi.search(params[:word], params[:year])
    render(json: { message: res['Error'] }, status: :bad_request) && return if res['Response'] == 'False'

    render(json: { words: Omdbapi.analyse(res) }) && return
  end

  private

    def invalid_request
      message = []
      message.push 'no search word supplied' if params[:word].blank?
      message.push 'no search year supplied' if params[:year].blank?
      render json: { message: message.to_sentence }, status: :bad_request
    end
end
