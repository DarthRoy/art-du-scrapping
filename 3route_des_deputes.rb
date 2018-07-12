require 'rubygems'
require 'nokogiri'
require 'open-uri'

#source de la liste :
#http://www2.assemblee-nationale.fr/deputes/liste/alphabetique

page = Nokogiri::HTML(open('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))
tmp=[]
tmp1=[]
data_link= page.css("a").select{|raw| raw ['href']=="lientxt"

      if raw["href"] != nil
        if raw["href"].include?("/deputes/fiche/OMC")
        tmp.push(raw["href"])
        tmp1.push raw.text
      end
    end
     }
     # liens des deputés

tmp2=[] # liens
tmp.each {|x|  tmp2<< "http://www2.assemblee-nationale.fr#{x}" }
tmp3=[]#mail
tmp2.each{ |lien| email=Nokogiri::HTML(open("#{lien}")).xpath("/html/body/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[1]/a")
email=email.css("a").select{|raw| raw ['href']=="lientxt"
                    tmp3 <<raw["href"].to_s.delete_prefix!("mailto:") }

}
data=Hash[tmp1.zip(tmp3)]
puts data
