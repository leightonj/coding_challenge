# Controller for home routes
class HomeController < ApplicationController
  before_action :perform_omdb_search, only: [:index]

  def index
    return invalid_request if params[:word].blank? || params[:year].blank?
    return invalid_api_request if @res['Response'] == 'False'
    render(json: { words: Omdbapi.analyse(@res) }) && return
  end

  private

    def perform_omdb_search
      @res = Omdbapi.search(params[:word], params[:year]) if params[:word].present? && params[:year].present?
    end

    def invalid_request
      message = []
      message.push 'no search word supplied' if params[:word].blank?
      message.push 'no search year supplied' if params[:year].blank?
      render json: { message: message.to_sentence }, status: :bad_request
    end

    def invalid_api_request
      render(json: { message: res['Error'] }, status: :bad_request)
    end
end
