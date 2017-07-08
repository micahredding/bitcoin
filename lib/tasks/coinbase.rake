# lib/tasks/coinbase/log.rake

namespace :coinbase do
  desc 'Log coinbase'
  task log: :environment do
    CoinbaseJob.log
  end
end
