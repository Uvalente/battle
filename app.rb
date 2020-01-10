# frozen_string_literal: true

require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    $game = Game.new(Player.new(params[:name1]), Player.new(params[:name2]))
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb(:play)
  end

  get '/attack' do
    @game = $game
    @game.turn == @game.player1.name ? @game.attack(@game.player2) : @game.attack(@game.player1)
    redirect '/gameover' if @game.game_over?
    redirect '/play'
  end

  get '/gameover' do
    @game = $game
    erb(:gameover)
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
