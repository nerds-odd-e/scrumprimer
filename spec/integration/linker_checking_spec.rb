# encoding: utf-8

require 'anemone'
require 'w3c_validators'
require 'attempt_to'

describe "Link checking tests" do
  
  def rspec_add_failure_message(message)
    begin
      yield
    rescue RSpec::Expectations::ExpectationNotMetError => e
      e.message << message
      raise e
    end
  end
  
  def anemone_on_every_page (url)
    Anemone.crawl(url) do |anemone|
      anemone.on_every_page do |page|
        yield page
      end
    end    
  end
    
  def retrieve_all_tag_sources (tag, attribute, must_be_present = :required)
    img_srcs = []
    anemone_on_every_page ("http://localhost:9292/") do |page|
      next unless page.html?
        
      page.doc.css(tag).map do |element|
        if must_be_present == :required  || (must_be_present == :optional && element[attribute])
          img_srcs << URI::Parser.new.parse(element[attribute]) 
        end
      end
    end
    img_srcs
  end
  
  def http_get_relative_or_absolute(url, local_host, local_port)
    host = url.host || local_host
    port = url.port || local_port
    path = url.path
    Net::HTTP.new(host, port).request_get(path) do |response|
      yield response
    end
  end

  it "Check all links", :integration => true do
    anemone_on_every_page ("http://localhost:9292/") do |page|
      rspec_add_failure_message("  (For page: #{page.url})") do
        page.code.should== 200
      end
    end
  end

  it "Check all images", :integration => true do
    retrieve_all_tag_sources('img', 'src').each do |image_url|
      http_get_relative_or_absolute(image_url, "localhost", 9292) do |response|
        rspec_add_failure_message("  (For page: #{image_url.to_s})") do
          response.kind_of?(Net::HTTPSuccess).should== true
        end  
      end
    end    
  end

  it "Check all links", :integration => true do
    retrieve_all_tag_sources('link', 'href').each do |url|
      http_get_relative_or_absolute(url, "localhost", 9292) do |response|
        rspec_add_failure_message("  (For page: #{url.to_s})") do
          response.kind_of?(Net::HTTPSuccess).should== true
        end  
      end
    end    
  end

  it "Check all scripts", :integration => true do
    retrieve_all_tag_sources('script', 'src', :optional).each do |url|
      http_get_relative_or_absolute(url, "localhost", 9292) do |response|
        rspec_add_failure_message("  (For page: #{url.to_s})") do
          response.kind_of?(Net::HTTPSuccess).should== true
        end  
      end
    end    
  end
  
  it "Validates the HTML", :integration => true do
    anemone_on_every_page("http://localhost:9292/") do |page|
      next unless page.html?
      
      results = attempt_to('connect to w3c validator', 3) do
        W3CValidators::MarkupValidator.new.validate_text(page.body)
      end
      
      # TBD also do the warnings. Now always have one warning which people say we can ignore a it is their problem ;P
      #        (results.errors + results.warnings).each do |error|
      results.errors.each do |error|
        rspec_add_failure_message("At page #{page.url}") {
          error.to_s.should== "none"
        }
      end
    end
  end
end
