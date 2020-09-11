class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.all
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
    @tweet = Tweet.find(params[:id]) 
  end

  # GET /tweets/new
  def new
    @tweet = current_user.tweet.new
  end

  # GET /tweets/1/edit
  def edit
    @tweet = current_user.tweet.find(params[:id])
  end

  # POST /tweets
  # POST /tweets.json
  # byebug
  def create
    @tweet = current_user.tweet.new(tweet_params)
    if @tweet.save
      redirect_to @tweet, notice: 'Tweet was successfully created.' 
    else
      render :new 
        
    end
  
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    @tweet = current_user.tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: 'Tweet was successfully updated.' 
    else
      render :edit
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet = current_user.tweet.find(params[:id])
    @tweet.destroy
      redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:user_id, :content)
    end
end
