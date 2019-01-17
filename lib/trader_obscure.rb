require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
	symb = []
	page.xpath('//*[@class="text-left col-symbol"]').each do |sy|
   		puts sy.text
   		symb << sy.text
	end
	
	pri = []
	page.xpath('//*[@class="price"]').each do |pr|
   		puts pr.text
   		pri << pr.text
   		end
h = Hash[symb.zip(pri.map {|i| i.include?(',') ? (i.split /, /) : i})]

#puts h
   	