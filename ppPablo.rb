require "imdb"
require "pry"
class Browser
	
	def initialize films	
		@films=films
		@filmsArray = []
		
	end

	def split_films
		@films = @films.split(";")
	end

	def Search_film
		@films = @films.map do |film|
			Imdb::Search.new(film).movies[0]
		end
	end

	def film_creator
		@films.each do |film|
			rating = film.rating.round
			title = film.title
			@filmsArray.push(Film.new(title,rating))
		end	
	end

	def send_array
		@filmsArray
	end
end

class Manager
	def initialize(filmsArray)
		@filmsArray = filmsArray
	end

	def print_films
		@filmsArray.each do |film|
			
			puts "#{film.title}: #{film.rating}"
		end	
	end
end	

	
class Film
	attr_reader :title,:rating
	def initialize(title,rating)
		@title = title
		@rating = rating

	end	
end

films = IO.read("pelis.txt")

my_browser = Browser.new(films)
my_browser.split_films
my_browser.Search_film
my_browser.film_creator
array_filmsended = my_browser.send_array
my_manager = Manager.new(array_filmsended)
my_manager.print_films

#Ghostbuster = Film.new(title[0],rating[0])

#puts Ghostbuster.rating

#############################################


