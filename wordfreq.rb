require 'pry'

class Wordfreq
  STOP_WORDS = ['a', 'an', 'and', 'are', 'as', 'at', 'be', 'by', 'for', 'from',
    'has', 'he', 'i', 'in', 'is', 'it', 'its', 'of', 'on', 'that', 'the', 'to',
    'were', 'will', 'with']

  def initialize(filename)
    @text = File.read(filename)
      .gsub(/\W/, ' ')
      .downcase
      .split(" ")
      .reject { |e| STOP_WORDS.include? e }
  end

  def frequency(word) #2
    if frequencies[word] == nil
      0
    else
      frequencies[word]
    end
  end

  def frequencies #1
    txt_hash = Hash.new
    @text.each do |f|
      txt_hash["#{f}"] = @text.count(f)
    end
    txt_hash
  end

  def top_words(number) #3
    frequencies.sort { |a, b| [b[1], a[0]] <=> [a[1], b[0]] }[0..(number - 1)]
  end

  def print_report #4
    
  end
end

if __FILE__ == $0
  filename = ARGV[0]
  if filename
    full_filename = File.absolute_path(filename)
    if File.exists?(full_filename)
      wf = Wordfreq.new(full_filename)
      wf.print_report
    else
      puts "#{filename} does not exist!"
    end
  else
    puts "Please give a filename as an argument."
  end
end
