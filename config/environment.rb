require 'bundler'
Bundler.require
require 'pry'
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
# binding.pry
# ActiveRecord::Base.logger.level = 1
require_all 'lib'
