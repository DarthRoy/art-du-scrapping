require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
puts page.css ("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").txt

#http://ruby.bastardsbook.com/chapters/html-parsing/

#1 on met la ref de ce qu'on veut (url d'un site ou d'un fichier etc. ... ici un fichier)
        #page = Nokogiri::HTML(open("index.html"))

#2 je veux rechercher l'élément titre de la page
# comme sur le site , il est indiqué qu'il faut rentré le code balise correspondant
# page.css('typeDeBalise')
        #puts page.css("title")
        #puts page.css ("p").text
        #puts page.css ("h1")
# pour choisir le numéro du paragphe (ou autre):
#puts page.css ("p[2]")
#==> Pour avoir uniquement le contenu : on ajoute la méthode .text

#3 internet
# ex sur le site http://annuaire-des-mairies.com/val-d-oise.html
        page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
#après avoir scrollé le html, on a vu que les lignes du tableau de la page
#étaient des class="lientxt". Donc en reprenant la méthode précédente, et en
#inscrivant juste .lientxt ça passe.
#on stocke ces lignes dans une méthode:
        url = page.css (".lientxt")
#tt ce que tu as dans l'url tu le fout dans x.(ici une valeur abstraite)
#On crée une nouvelle variable qui va "bosser" sur la précédente.
#D'ou le bis pour ne pas se planter.
#Du coup j'appelle la valeur x et je lui demande de me sortir uniquement
#la partie lien avec l'attribut "href".
        #url.each do |x|
        #url_bis = "http://annuaire-des-mairies#{x["href"]}"
        #puts url_bis
        #end

#4 Choper des mails sur le site :
#http://annuaire-des-mairies.com/val-d-oise.html
#a) on va choper l'email d'une ligne.
      #page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
# comme vu précédemment, on examine la page via clqiue droit "examiner l'élément" (firefox).
#on déroule l'arborescance jusqu'à tomber sur la partie mails.
# une fois arrivé, clique gauche sur une ligne, puis clique droit, copier, Xpath
# et on colle dans les guillements ci dessous.
      #puts page.css ("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").txt
#b) on va faire en sorte que la machine automatise la procédure sur toute la page. 
