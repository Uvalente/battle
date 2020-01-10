# frozen_string_literal: true

require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions

  before do
    @game = Game.instance
  end

  get '/' do
    erb(:index)
  end

  post '/names' do
    @game = Game.create(Player.new(params[:name1]), Player.new(params[:name2]))
    redirect '/play'
  end

  get '/play' do
    erb(:play)
  end

  get '/attack' do
    @game.turn == @game.player1.name ? @game.attack(@game.player2) : @game.attack(@game.player1)
    redirect '/gameover' if @game.game_over?
    redirect '/play'
  end

  get '/gameover' do
    erb(:gameover)
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
