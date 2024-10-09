class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new  # formヘルパーのデータの入れ物になる
  end
  
  def create
    @tweet = Tweet.new(message: params[:tweet][:message])
    @tweet.tdate = Time.current # tdateに現在時刻を設定

    if @tweet.save
      redirect_to '/' # 一覧ページにリダイレクトする
    else
      flash.now[:alert] = "ツイートできません"
      # バリデーションエラーがある場合は、再度newテンプレートを表示
      render :new
    end
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to '/' # 不要な文字がないことを確認
  end
  
  def show
    @tweet = Tweet.find(params[:id])
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(message: params[:tweet][:message])
      redirect_to '/' # 更新が成功した場合
    else
      flash.now[:alert] = "ツイートできません"
      render :edit # バリデーションエラーがあった場合
    end
  end
end
