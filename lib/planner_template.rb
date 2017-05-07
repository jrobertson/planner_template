#!/usr/bin/env ruby

# file: planner_template.rb

require 'nokorexi'

module LIBRARY

  def fetch_filepath(filename)

    lib = File.dirname(__FILE__)
    File.join(lib, '..', 'template', filename)
  end
  
  def fetch_file(filename)

    filepath = fetch_filepath filename
    read filepath
  end
  

  def generate_webpage(xml, xsl)
    
    # transform the xml to html
    doc = Nokogiri::XML(xml)
    xslt  = Nokogiri::XSLT(xsl)
    xslt.transform(doc).to_s   
  end

  def read(s)
    RXFHelper.read(s).first
  end
end

class PlannerTemplate
  include LIBRARY
  
  
  def initialize(src, template: 'default')
    
    @xml = read src
    @xmldoc = Rexle.new(@xml)   
    @template = template 
        
  end
  
  def to_html()
    xsl    = fetch_file File.join(@template, 'planner.xsl')
    @html = generate_webpage(@xml, xsl)
  end
  
  def to_xml(options)
    Rexle.new(@xml).xml(options)
  end
  
  protected
  
  def fetch_css()
    
    %w(layout.css style.css).map do |filename|
      fetch_file File.join(@template, filename)
    end

  end
  
end
