require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
link = page.css (".lientxt")
  link.each do |x|
    link_bis = "http://annuaire-des-mairies#{x["href"]}"
    puts link_bis
#On dit à Nokogiri d'aller chercher tous les liens de link_bis (parce qu'il n'y a que de sliens dans linkbis)
  page = Nokogiri::HTML(open(link_bis))
    puts page.css ("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
  end
