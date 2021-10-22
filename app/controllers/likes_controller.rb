class LikesController < ApplicationController
  def create 
    tweet = Tweet.find(params[:tweet_id])
    unless tweet.liked?(current_user)
      tweet.like(current_user)
    end
    flash[:notice] = 'いいねしました'
    redirect_to root_path
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.liked?(current_user)
      tweet.unlike(current_user)
    end
    flash[:notice] = 'いいね消しました'
    redirect_to root_path
  end
end
