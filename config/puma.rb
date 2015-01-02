#!/usr/bin/env puma

rails_env = ENV['RAILS_ENV'] || 'development'
rackup DefaultRackup

environment rails_env
bind 'unix:///var/run/puma/fincastali-www.sock'

require "#{ Dir.pwd }/config/puma/#{ rails_env }.rb"

