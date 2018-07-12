require 'rubygems'
require 'nokogiri'
require 'open-uri'


def scrap
list = {}
page =
page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
puts page.class
get_links = page.css('.lientxt')
get_links.each do |x|
url = "http://annuaire-des-mairies.com#{x['href']}"
page = Nokogiri::HTML(open(url))
mails = page.css('/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]').text
list.merge!(url: url, email: mails)
puts list
end
end
scrap
