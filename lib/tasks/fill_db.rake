task :fill_db => :environment do
  SOURCE_FILE = ENV["SOURCE"]
  source = open(SOURCE_FILE).read
  source.each_line do |line|
    entry_txt = line.split("\t")
    entry = Entry.new
    entry.romaji = entry_txt[6]
    entry.kana = entry_txt[3]
    entry.writing = entry_txt[7].gsub("\n", "")
    entry.definition_de = entry_txt[5]
    entry.definition_en = entry_txt[4]
    entry.save
  end
end
