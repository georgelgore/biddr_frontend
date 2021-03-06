require 'csv'

# SALE
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'sales.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   Sale.create(id: row['id'], house_id: 1, title: row['title'], internal_id: row['internal_id'], sale_date:row['sale_date'], sum: row['sum']  )
#   puts "row#{row}"
# end

ARTISTS
csv_text = File.read(Rails.root.join('lib', 'seeds', 'artists.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  byebug
  Artist.create(id: row['id'], name: row['name'], image:row['image'])
  puts "Artist#{row}"
end

# Lots
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'lots.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   l = Lot.new
#   l.id = row['id']
#   l.lot_number = row['lot_number']
#   l.image = row['image']
#   l.artist_id = row['artist_id']
#   l.art_title = row['art_title']
#   l.size_mat = row['size_mat']
#   l.estimate_low = row['estimate_low']
#   l.estimate_high = row['estimate_high']
#   l.realized = row['realized']
#   l.sale_id = row['sale_id']
#
#   l.save
#   puts "Lot#{row}"
# end
#
# # HighLot
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'high_lots.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#     l = HighLot.new
#     l.id = row['id']
#     l.lot_number = row['lot_number']
#     l.image = row['image']
#     l.artist_id = row['artist_id']
#     l.art_title = row['art_title']
#     l.size_mat = row['size_mat']
#     l.estimate_low = row['estimate_low']
#     l.estimate_high = row['estimate_high']
#     l.realized = row['realized']
#     l.sale_id = row['sale_id']
#     l.artist_name = row['artist_name']
#     l.lot_id = row['lot_id']
#
#     l.save
# end
#
# # TopArtist
# csv_text2 = File.read(Rails.root.join('lib', 'seeds', 'top_artists.csv'))
# csv2 = CSV.parse(csv_text2, :headers => true, :encoding => 'ISO-8859-1')
# csv2.each do |row|
#   TopArtist.create(id: row['id'], name: row['name'], image:row['image'])
# end
#
# # TopSale
# csv_text3 = File.read(Rails.root.join('lib', 'seeds', 'top_sales.csv'))
# csv3 = CSV.parse(csv_text3 , :headers => true, :encoding => 'ISO-8859-1')
# csv3.each do |row|
#   TopSale.create(id: row['id'], house_id: 1, title: row['title'], internal_id: row['internal_id'], sale_date:row['sale_date'], sum: row['sum']  )
# end


# House.create(name:"Christie's")
# House.create(name:"Sotheby's")
# Sale.create(house_id: 1, title:"First Open Post-War and Contemporary Art", internal_id: "1806", sale_date: Date.parse("28 February 2007") )


# sales = Sale.all.sort_by{|sale| sale.lots.map{|lot| lot.realized}.reduce(:+)}[-10..-1]
# sales.each{|sale| TopSale.create(house_id: sale.house_id, title: sale.title, internal_id: sale.internal_id, sale_date: sale.sale_date)}
#
# artists = Artist.all.sort_by{|sale| sale.lots.map{|lot| lot.realized}.reduce(:+)}[-11..-1]
# artists.each{|artist| TopArtist.create(name: artist.name, image: artist.image)}

# lots = Lot.all.sort_by{|lot| lot.realized}[-11..-1]
# lots.each{|lot| HighLot.create(lot_number: lot.lot_number, artist_id: lot.artist_id, image: lot.image, art_title: lot.art_title, size_mat: lot.size_mat, estimate_low: lot.estimate_low, estimate_high: lot.estimate_high, realized: lot.realized, sale_id: lot.sale_id)}

# Dir.foreach('../christies_datascrape/ALL/2012-2017') do |item|
#   next if item == '.' or item == '..' or item == '.DS_Store' or item.nil?
#   file = File.read('../christies_datascrape/all/2012-2017/' + item)
#   data_hash = JSON.parse(file)
#
#   # SALE
#   sale_date = Date.parse(data_hash['sale_date'])
#   sale_info = data_hash['sale_info'].split("|")[0][0...-1]
#   sale_title = data_hash['sale_title']
#   sale = Sale.create(house_id: 1, title: sale_title, internal_id: sale_info, sale_date: sale_date )
#   #ARTIST
#   data_hash["Lots"].compact.each do |lot|
#     next if lot == [] ||  lot["lot_number"].nil? || lot.length != 7
#
#     artist_name = lot['artist_name'].split("(")[0].split.join(" ").gsub('ö', 'o').gsub('é', 'e').gsub('á', 'a').gsub('ê', 'e').gsub('ü', 'u').gsub('ç', 'c').upcase
#     artist_name.gsub('Ö', 'O')
#
#     artist = Artist.find_or_create_by(name: artist_name)
#   # #LOT
#   lot_real = lot["realized"][1..-1].gsub(",", "").to_i ? lot["realized"][1..-1].gsub(",", "").to_i : lot["realized"]
#       lot = Lot.create(
#         lot_number: lot["lot_number"],
#         artist_id: artist.id,
#         image: lot["image"],
#         art_title:lot["art_title"],
#         size_mat: lot["size_mat"],
#         sale_id: sale.id,
#         realized: lot_real,
#         estimate_low: lot["estimate"].split.first[1..-1].gsub(",", "").to_i,
#         estimate_high: lot["estimate"].split.last[1..-1].gsub(",", "").to_i
#       )
#   end
# end

# file = File.read('../christies_datascrape/2007/JSON/1_spring_first_open_2007.json')
# data_hash = JSON.parse(file)
#
# # LOTS
# data_hash["Lots"].each do |lot|
#     artist_name = lot['artist_name'].split("(")[0].split.join(" ")
#     artist_obj = Artist.find_or_create_by(name: artist_name)
#
#
# end
# ARTIST
# puts data_hash["Lots"][0]["image"]
# puts data_hash["Lots"][0]["art_title"]
# puts data_hash["Lots"][0]["size_mat"]
# puts data_hash["Lots"][0]["estimate"].split[0][1..-1]
# puts data_hash["Lots"][0]["estimate"].split[-1][1..-1]
# puts data_hash["Lots"][0]["realized"][1..-1]

# name1 = el['artist_name'].split.join(" ").split("(")[0].capitalize
#
