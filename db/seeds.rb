# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'nokogiri'
def f
  File.open("../datos/ReddeHospitalesGDF.kml")
end
def kml
  this = Nokogiri::XML(f)
  this.remove_namespaces!
end

def extract_desc(desc)
  cdata = Nokogiri::HTML(desc.text)
  cdata.remove_namespaces!
  cdata.xpath("//div").text
end

kml.remove_namespaces!
placemarks = kml.xpath("//Document/Placemark")



places = []
placemarks.each do |p|
  name = p.xpath("name").text
  coord = p.xpath("Point/coordinates").text
  texto = extract_desc(p.xpath("description"))
  
  puts name, coord, texto
end

# placemarks.xpath("//name").each do |p|
#   puts p.text
# end

# placemarks.xpath("//Point/coordinates").each do |p|
#   puts p.text
# end
# #puts placemarks.xpath("//description").text

# desc = placemarks.xpath("//description")

