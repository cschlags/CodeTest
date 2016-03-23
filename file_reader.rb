class Filereader
  LocalFiles = ["comma.txt", "pipe.txt", "space.txt"]
  attr_accessor :person_array
  def initialize
    self.person_array = Array.new
    manipulate_files
    output_1
    output_2
    output_3
  end
# method - take in the files and read each line. Use regex to remove | , and whitespaces. Set everything as array
  def manipulate_files
    LocalFiles.each do |file_name|
      File.foreach("text_files/#{file_name}") do |line|
        @person_array.push(line.split(/\W+/))
      end
    end
  end
# method - returns output 1
  def output_1
  end
# method - returns output 2
  def output_2
  end
# method - returns output 3
  def output_3
  end
end

read = Filereader.new