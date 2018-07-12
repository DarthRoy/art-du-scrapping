require 'rubygems'
require 'nokogiri'
require 'open-uri'


def darktrader
currency_name = []
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")).css(".currency-name-container").each do |item|
  name = item.text
  currency_name << name
end
currency_price = []
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")).css(".price").each do |item|
  price = item.text
  currency_price << price
end
puts Hash[currency_name.zip(currency_price)]
end
darktrader
