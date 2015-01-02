#!/usr/bin/env puma

rails_env = ENV['RAILS_ENV'] || 'development'
rackup DefaultRackup

environment rails_env
stdout_redirect "log/#{ rails_env }.log", "log/#{ rails_env }_err.log"

eval File.read("config/puma/#{ rails_env }.rb")

