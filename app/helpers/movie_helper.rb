# frozen_string_literal: true

module MovieHelper
  def movie_select_options
    Movie.sorted.map { |movie| [movie.title, movie.id] }.unshift(['--', nil])
  end
end
