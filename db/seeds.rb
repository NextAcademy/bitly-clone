require 'csv'
require 'securerandom'

url_arr = []
p 'before csv'
count =1

CSV.foreach('test.csv') do |row|
	begin
		serial_code_gen = SecureRandom.hex(3)
	end	while url_arr.flatten.include? serial_code_gen

	url_arr.push([row[0][/\w.+\w/], serial_code_gen])
	p count
	count += 1
end

url_str = ''

count = 1
url_arr.each do |elm|
	puts count
	url_str += "(\'#{elm[0]}\', \'#{elm[1]}\'),"
	count += 1
end

url_str.chop!
url_str += ';'
count =1
p count
Url.transaction do
	puts count
	Url.connection.execute "INSERT INTO urls (link, serial_code) VALUES #{url_str}"
	count += 1
end