require 'nokogiri'
require 'open-uri'
require 'rubygems'

def get_townhall_urls
all_urls = []
 page2 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    page2.xpath('//a[@class="lientxt"]').each do |vo|
    all_urls << vo['href']
	end
	return all_urls
end
 
 	get_townhall_urls.each do |li|
 	mail_list = []
page1 = Nokogiri::HTML(open("https://annuaire-des-mairies.com/#{li}"))
   page1.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |av|
   mail_list << av.text
   end
   return mail_list
end
get_townhall_urls

def val_doise_townhalls(get_townhall_urls)
	get_to = get_townhall_urls
	v = [] 
    page3 = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
    page3.css("a.lientxt").each do |el|
        v << el.text
    end
   return v
   h = Hash[v.zip(get_to.map {|i| i.include?(',') ? (i.split /, /) : i})]
   puts h
end
val_doise_townhalls(get_townhall_urls)