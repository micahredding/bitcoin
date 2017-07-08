require 'coinbase/exchange'
require 'eventmachine'

class CoinbaseJob < ActiveJob::Base

  def self.log
    rest_api = Coinbase::Exchange::AsyncClient.new(ENV['API_KEY'], ENV['API_SECRET'], ENV['API_PASS'], api_url: "https://api-public.sandbox.gdax.com")
    rest_api = Coinbase::Exchange::SyncClient.new(ENV['API_KEY'], ENV['API_SECRET'], ENV['API_PASS'], api_url: "https://api-public.sandbox.gdax.com")
    btc_us = Coinbase::Exchange::Websocket.new(product_id: 'BTC-USD', keepalive: true)
    ltc_us = Coinbase::Exchange::Websocket.new(product_id: 'LTC-USD', keepalive: true)
    eth_us = Coinbase::Exchange::Websocket.new(product_id: 'ETH-USD', keepalive: true)

    rest_api.last_trade do |resp|
      p resp
    end

    # order = nil
    # rest_api.bid(10, 250) do |resp|
    #   order = resp
    # end

    # btc_us.match do |msg|
    #   puts msg.price
    # end

    # ltc_us.match do |msg|
    #   puts msg.price
    # end

    # eth_us.match do |msg|
    #   puts msg.price
    # end

    # btc_us.start!
    # ltc_us.start!
    # eth_us.start!

  end

end
