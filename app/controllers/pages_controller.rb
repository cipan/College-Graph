class PagesController < ApplicationController

def graph
    @data = Sort.new('/home/cole/rails_projects/college_chart/data/P17_2011.csv') 
    
    @data_table = GoogleVisualr::DataTable.new

    @data_table.new_column('number', 'Year' )

    @data.categoryList.length.times do |j|
      @data_table.new_column('number', @data.categoryList[j].categoryName) 
    end
    @data_table.add_rows((@data.categoryList[0].earnedIn.length))

    1958.upto(1990) do |q|  
      @data_table.set_cell(q-1958, 0, q)
    end 

    @data.categoryList.each do |category|
        array = []

        category.earnedIn.each do |key, value|

          array.unshift(value)
        end


       array.length.times do |i|

          @data_table.set_cell(i, @data.categoryList.index(category)+1, array[i])
        end
    
    end


  opts = { width: 2000, height: 1000, title: 'College Years vs Wage', hAxis: {title: 'Year', titleTextStyle: {color: '#FF0000'}} }
  @chart = GoogleVisualr::Interactive::AreaChart.new(@data_table, opts) 
  end
  def index
  end
end