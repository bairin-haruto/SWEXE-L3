module TweetsHelper
end

class TweetsController < ApplicationController
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path, notice: 'ツイートを削除しました。'
  end
end
