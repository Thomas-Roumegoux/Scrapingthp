require 'rubygems'
require 'nokogiri'
require 'open-uri'  
def get_the_email_of_a_townhal_from_its_webpage (my_url)
    @page = Nokogiri::HTML(open("#{my_url}"))
     @new_email = @page.css('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
end
def get_all_the_urls_of_val_doise_townhalls
    @new_array = []
    @new_urls = []
    @page_2 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    @news_urls = @page_2.css("a").select{|link| link['class'] == "lientxt"}
    @array_of_urls = @news_urls.each{|link|@new_array << link["href"].gsub("./","http://annuaire-des-mairies.com/") } #{}"#{@debut_url}#{link['href']}" }
end
def get_all_mails
    @mails = []
    @i = 0
    while @i < @r
        @url = @new_array[@i]
        @mails << get_the_email_of_a_townhal_from_its_webpage(@url)
        @i = @i + 1
    end  
end
get_all_the_urls_of_val_doise_townhalls
@r = @new_array.length
get_all_mails
puts @mails