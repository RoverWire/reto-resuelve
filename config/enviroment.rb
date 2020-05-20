ENV['RACK_ENV'] ||= :test

# Disable Ruby 2.7.1 deprecated warnings listed on
# https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/
Warning[:deprecated] = false unless RUBY_VERSION < '2.7'

require_relative './application'
