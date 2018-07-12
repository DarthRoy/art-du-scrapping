require 'rubygems'
require 'nokogiri'
require 'open-uri'

#http://annuaire-des-mairies.com/
#récupérer les adresses emails des mairies du Val d'Oise.



#def get_the_email_of_a_townhal_from_its_webpage
#page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
#puts page.css ("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").txt
#end
#



#def get_all_the_urls_of_val_doise_townhalls
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
link = page.css (".lientxt")
  link.each do |x|
    link_bis = "http://annuaire-des-mairies#{x["href"]}"
    puts link_bis
#On dit à Nokogiri d'aller chercher tous les liens de link_bis (parce qu'il n'y a que de sliens dans linkbis)
  page = Nokogiri::HTML(open(link_bis))
    puts page.css ("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
  end
#end
#get_all_the_urls_of_val_doise_townhalls
