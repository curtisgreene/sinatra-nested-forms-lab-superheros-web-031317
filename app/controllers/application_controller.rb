require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :'super_hero'
    end

    post '/teams' do
      #instances
      @team = Team.new(params[:team])
      @heroes = params[:team][:heroes].map do |hero|
        Hero.new(hero)
      end
      erb :teams
    end

end
