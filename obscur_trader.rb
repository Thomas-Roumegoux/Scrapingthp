require 'rubygems'
require 'nokogiri'
require 'open-uri'  

def crypto_name
	@array_name = []
	@page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	@crypto_name = @page.css("a").select{|link| link['class'] == "currency-name-container link-secondary"}
	@array_of_names = @crypto_name.each{|link|@array_name << link["href"].gsub("./","https://coinmarketcap.com/all/views/all/") }
end

def crypto_price
	@array_price = []
	@page_2 = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	@crypto_price = @page_2.css("a").select{|link| link['class'] == "price"}
	@array_of_price= @crypto_price.each{|link|@array_price << link["data-usd"].gsub("./","https://coinarketcap.com/all/views/all/") }
end

def crypto_hash
	@crypto_hash = Hash.new
	@crypto_hash = @array_name.zip(@array_price)
end

crypto_name
crypto_price
crypto_hash
#puts @new_array
#puts @array_price
puts @crypto_hash
