class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :load_quote
  helper_method :resource_name, :resource, :devise_mapping, :resource_class

  def my_movies
    watched_movies = UserMovie.where(user_id: current_user)
    @my_movies = Movie.where.not(id: watched_movies.pluck(:movie_id)).order(:created_at)
  end

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end


private


def load_quote
  require "open-uri"
 response = open("https://andruxnet-random-famous-quotes.p.mashape.com/?cat=movies&count=1000",
        {
          "X-Mashape-Key" => "cG6SGJcfYDmshzKop80UmgWNqIhqp1NaNx3jsnPxNDl9cQydXX",
          "Accept" => "application/json"
        })
    @quote = JSON.parse(response.read)[0]
  end

end
