require 'sinatra'
require 'rack/test'
require 'test/unit'

require File.join(File.dirname(__FILE__),'../lib', 'app')
$LOAD_PATH << File.join(File.dirname(__FILE__),'../lib')

set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false