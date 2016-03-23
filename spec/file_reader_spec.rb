describe Filereader do
  context "manipulate file contents" do
    before(:each) do
      @file_reader = Filereader.new
      @file_name1 = "this.txt"
      @file_name2 = "comma.txt"
      @line = "Abercrombie, Neil, Male, Tan, 2/13/1943\n"
    end
    it 'if file is not present local' do
      array = @file_reader.manipulate_content(@file_name1, @line)
      expect(array).to eq nil
    end

    it 'if file is present local' do
      array = @file_reader.manipulate_content(@file_name2, @line)
      expect(array).to be_a(Array)
    end
  end

  context "checking gender proper gender return" do
    before(:each) do
      @file_reader = Filereader.new
    end
    it 'if gender is M then show male' do
      gender_string = @file_reader.change_gender('M')
      expect(gender_string).to eq 'Male'
    end
    it 'if gender is F then show female' do
      gender_string = @file_reader.change_gender('F')
      expect(gender_string).to eq 'Female'
    end
    it 'if gender is showing other than M or F should fail' do
      gender_string = @file_reader.change_gender('D')
      expect(gender_string).to eq nil
    end
  end
  context "checking output 1" do
    before(:each) do
      @person_array = [["Abercrombie", "Neil", "Male", "2/13/1943", "Tan"], ["Seles", "Monica", "Female", "12/2/1973", "Black"], ["Kournikova", "Anna", "Female", "6/3/1975", "Red"]]
    end
    it 'output 1 first to show female' do
      @person_array.sort_by!{ |a| [a[2], a[0]] }
      gender = @person_array.first[2]
      expect(gender).to eq "Female"
    end
    it 'output 1 last to show male' do
      @person_array.sort_by!{ |a| [a[2], a[0]] }
      gender = @person_array.last[2]
      expect(gender).to eq "Male"
    end
    it 'output 1 last to show male' do
      @person_array.sort_by!{ |a| [a[2], a[0]] }
      name = @person_array.first[0]
      expect(name).to eq "Kournikova"
    end
  end
  context "checking output 2" do
    before(:each) do
      @person_array = [["Abercrombie", "Neil", "Male", "2/13/1943", "Tan"], ["Seles", "Monica", "Female", "12/2/1973", "Black"], ["Kournikova", "Anna", "Female", "6/3/1975", "Red"]]
    end
    it 'output 2 first to show date is Abercrombie' do
      @person_array.sort_by!{ |a| [a[3].split("/").last, a[0]] }
      name = @person_array.first[0]
      expect(name).to eq "Abercrombie"
    end
  end
  context "checking output 3" do
    before(:each) do
      @person_array = [["Abercrombie", "Neil", "Male", "2/13/1943", "Tan"], ["Seles", "Monica", "Female", "12/2/1973", "Black"], ["Kournikova", "Anna", "Female", "6/3/1975", "Red"]]
    end
    it 'output 3 first to show name is Seles' do
      @person_array.sort!.reverse!
      name = @person_array.first[0]
      expect(name).to eq "Seles"
    end
  end
end