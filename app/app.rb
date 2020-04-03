require 'sinatra'
require 'sinatra/activerecord'
require 'pg'
require 'json'
require 'sidekiq'
require_relative './models/channel'

class App < Sinatra::Base
  get '/svc/webhook/:channel_name/:secret_key' do
      
      channel_name = params['channel_name']
      secret_key = params['secret_key']
      
      begin
        channel = Channel.where(name: channel_name, secret_key: secret_key).take!
        Sidekiq::Client.push('class' => 'SvcPostManWorker', 'args' => [channel.id, params])
        resp = { message: 'Channel invoke success', status: 200}
      rescue
        #Si el channel no existe, es decir que el nombre y su secret key no coinciden, errorazo de la defenza.
        resp = { message: 'Channel invalid', status: 400}        
      end

      content_type :json
      halt status, resp.to_json

  end
end