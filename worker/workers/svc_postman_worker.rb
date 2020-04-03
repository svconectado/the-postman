require 'dotenv/load'
require 'require_all'
require 'yaml'
require 'logger'
require 'sinatra/activerecord'
require 'pg'
require 'json'
require 'sidekiq'
require_relative '../models/channel'
require_all 'services'

Sidekiq.configure_server do |config|
  template = ERB.new File.new('config/database.yml').read
  db_config = YAML.load template.result(binding)
  ActiveRecord::Base.establish_connection(db_config[ENV['RACK_ENV']])
end

class SvcPostManWorker
  include Sidekiq::Worker

  def perform(channel_id, webhook_params)   
    channel = Channel.find(channel_id)
    service = channel.service
    Object.const_get(service).new.run(webhook_params)
  end

end