require './api/root'
Warning[:deprecated] = false unless RUBY_VERSION < '2.7'
run API::Root
