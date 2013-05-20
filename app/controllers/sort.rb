require_relative 'category'

class Sort
attr_reader :categoryList

# Open file and iterator over. Finds entry numbers for CATEGORY. Finds line title of CATEGORY matching school format. Then creates CATEGORY object type. (Hashes year to men's current dollars)

  def initialize(datafile)
    categoryList = []
    earnedIn = {}
    yearMatch = (/\d\d\d\d/)
    moneyMatch = (/\d+,\d+|NA/)
    categoryMatch = (/^\s*\"+\s*(.*?)\s*(?:\"+\s*)/)

    #datafile = 'P17_2011.csv'
    f = File.open(datafile)
    begin
      while  line = f.gets

        if line.upcase  =~ (/(ELEMENTARY|HIGH SCHOOL|COLLEGE)/)
          categoryName= line.scan(categoryMatch)[0]


          #Insert method to scan for year range
          #May need to convert year and earnings to integers rather than floats
          @nilEarn
          33.times do
              line = f.gets
              year = (yearMatch).match(line).to_s.to_i
              earnings = line.scan(moneyMatch)[1]
              #Deal with non existant data find how to average values
              if earnings != "NA"
                earnings = earnings.tr(',', '').to_i
                @nilEarn = earnings
              else
                earnings = @nilEarn
              end

              earnedIn = earnedIn.merge( year => earnings)

          end
             category = Category.new(categoryName, earnedIn)
            categoryList.push(category)
        end
      end
      @categoryList = categoryList
      #TEST PURPOSES
      #puts @categoryList[1].earnedIn(1990)
    rescue

    ensure
    f.close
    end
  end
end


