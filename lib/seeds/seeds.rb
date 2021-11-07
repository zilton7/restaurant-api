require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'glints.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
csv.each do |row|
  t = AllRestaurant.new
  t.name = row['name']
  t.opening_date = row['opening_date']
  t.save
  puts "#{t.name}, #{t.opening_date} saved"
end

puts "There are now #{AllRestaurant.count} rows in the all_restaurants table"
