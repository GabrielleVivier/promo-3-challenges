require 'Date'

class Webzine

  def initialize(name, subject, creation_year)
    @name = name
    @subject = subject
    @creation_year = creation_year
  end

  def is_a_blog
    puts "It is a webzine, it is not a blog"
  end

  def webzine_of_the_year

    if @creation_year == DateTime.now.year
      puts "#{@name} was created this year"
    else
      puts "#{@name} is already fuckin' old!"
    end
  end

  def webzine_in_tech

    if @subject == "tech"
      puts "#{@name} is a tech webzine"
    else
      puts "#{@name} is not a tech webzine"
    end
  end

end

techcrunch = Webzine.new("techcrunch", "tech", 2005)

techcrunch.is_a_blog

techcrunch.webzine_of_the_year

techcrunch.webzine_in_tech