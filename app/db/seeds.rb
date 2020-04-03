require 'sinatra/activerecord'
require_relative '../models/channel'

c = Channel.new
c.owner = 'Secretaria de Innovacion'
c.service = 'GoesAyuda300CovidService'
c.name = 'goes-ayuda-300-covid'
#c.secret_key = SecureRandom.hex(12)
c.secret_key = '123456'
c.enviroment = '{}'
c.save!