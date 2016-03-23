class Filereader
  LocalFiles = ["comma.txt", "pipe.txt", "space.txt"]
  attr_accessor :person_array
  def initialize
    self.person_array = Array.new
    grab_file
    output_1
    output_2
    output_3
  end

  def grab_file
    LocalFiles.each{|file_name| grab_line(file_name)}
  end

  def grab_line(file_contents)
    File.foreach("text_files/#{file_contents}"){|line| manipulate_content(file_contents, line)}
  end

  def manipulate_content(file_name, line)
    case file_name
    when "comma.txt"
      removed_characters = line.gsub("-","/").split(/,|\|/).collect(&:strip)
      color = removed_characters.slice!(3)
      @person_array.push(removed_characters.push(color))
    when "pipe.txt"
      removed_characters = line.gsub("-","/").split(/,|\|/).collect(&:strip)
      removed_characters.slice!(2)
      color = removed_characters.slice!(3)
      removed_characters[2] = change_gender(removed_characters[2])
      @person_array.push(removed_characters.push(color))
    when "space.txt"
      removed_characters = line.gsub("-","/").split(/,|\||\s/).collect(&:strip)
      removed_characters.slice!(2)
      removed_characters[2] = change_gender(removed_characters[2])
      @person_array.push(removed_characters)
    end
  end

  def change_gender(gender)
    case gender
    when "M"
      "Male"
    when "F"
      "Female"
    end
  end

  def output_1
    puts "\nOutput 1: \n"
    @person_array.sort_by!{ |a| [a[2], a[0]] }
    @person_array.each do |value|
      puts value.join(" ")
    end
  end

  def output_2
    puts "\nOutput 2: \n"
    @person_array.sort_by!{ |a| [a[3].split("/").last, a[0]] }
    @person_array.each do |value|
      puts value.join(" ")
    end
  end

  def output_3
    puts "\nOutput 3: \n"
    @person_array.sort!.reverse!
    @person_array.each do |value|
      puts value.join(" ")
    end
  end
end

read = Filereader.new