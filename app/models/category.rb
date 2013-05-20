class Category

  attr_reader :categoryName, :earnedIn

  def initialize(categoryName, earnedIn)
    @categoryName = categoryName
    @earnedIn = earnedIn
  end

end