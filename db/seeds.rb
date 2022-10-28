# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
API_KEY = '3d09e081445fabd9d862b54134b04b98'
IMAGE_BASE_URL = 'https://image.tmdb.org/t/p/original/'

API_PAGES = 3


# URL for fetching images
def get_poster_url(poster_path)
  "https://image.tmdb.org/t/p/original/#{poster_path}"
end

# URL for browsing most popular movies
def get_details_url(page_number, api_key)
  "https://api.themoviedb.org/3/movie/popular?api_key=#{api_key}&language=en-US&page=#{page_number}"
end

# EXECUTION

API_PAGES.times do |number|
  html_file = RestClient.get(get_details_url(number + 2, API_KEY))
  html_data = JSON.parse(html_file)

  movies_data = html_data['results']

  puts "Filling the database with #{movies_data.count} movies"

  movies_data.each do |movie_data|
    movie = Movie.new(
      title: movie_data['title'],
      overview: movie_data['overview'],
      poster_url: get_poster_url(movie_data['poster_path']),
      rating: movie_data['vote_average']
    )
    puts "Successfully created movie '#{movie.title}', with id #{movie.id}" if movie.save!
  end
end
