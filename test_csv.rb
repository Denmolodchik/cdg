require "csv"
HEADERS = [
  'dog',
  'cat',
  'donkey'
]


  CSV.open('t.csv', "w", :headers => HEADERS, :write_headers => true) do |csv|
    csv << { 'dog' => 'canine', 'cat' => 'feline', 'donkey' => 'asinine' }
    csv << { 'dog' => 'canine'}
    csv << { 'cat' => 'feline', 'dog' => 'canine', 'donkey' => 'asinine' }
    csv << { 'dog' => 'canine', 'cat' => 'feline', 'donkey' => 'asinine', 'header not provided in the options to #open' => 'not included in output' }
  end

  CSV.open('t.csv', "w", :headers => HEADERS, :write_headers => true) do |csv|
    csv << { 'dog' => 'canine', 'cat' => 'feline', 'donkey' => 'asinine' }
    csv << { 'dog' => 'canine'}
    csv << { 'cat' => 'feline', 'dog' => 'canine', 'donkey' => 'asinine' }
    csv << { 'dog' => 'canine', 'cat' => 'feline', 'donkey' => 'asinine', 'header not provided in the options to #open' => 'not included in output' }
  end

  table = CSV.parse(File.read("t.csv"), headers: true)
  puts table[0]["dog"]
  puts table[0]["donkey"]
  puts table.by_col[0]
