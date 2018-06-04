class ProfilesController < ApplicationController
  def create
  end

  def show
    @friend = User.find_by_id(params[:id])
    @movies = @friend.movies
    top_tags
  end

  def destroy
  end

  def top_tags
    freq = @friend.tags.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    @top_tags = freq.sort_by{|k,v| -v}[0..2].flatten
    @top_tags.delete_at(1)
    @top_tags.delete_at(2)
    @top_tags.delete_at(3)
  end
end
