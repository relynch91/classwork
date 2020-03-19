require 'singleton'
require 'sqlite3'

class MovieDatabase < SQLite3::Database
  include Singleton

  def initialize
    super(File.dirname(__FILE__) + "/../movie.db")

    self.results_as_hash = true
    self.type_translation = true
  end

  def self.execute(*args)
    self.instance.execute(*args)
  end
end

# 1. Obtain the cast list for the movie "Top Gun"; order by the
# actor's name.
def top_gun_cast
  MovieDatabase.execute(<<-SQL)
  SELECT
    actors.name
  FROM
    actors
      JOIN castings ON castings.actor_id = actors.id
      JOIN movies ON movies.id = castings.movie_id
  WHERE
    movies.title = 'Top Gun'
  ORDER BY
    actors.name
  SQL
end


# 2. List the films in which 'Harrison Ford' has appeared; order by
# movie title.
def harrison_ford_films
  MovieDatabase.execute(<<-SQL)
  SELECT
    movies.title 
  FROM
    actors
      JOIN castings ON castings.actor_id = actors.id
      JOIN movies ON movies.id = castings.movie_id
  WHERE
    actors.name = 'Harrison Ford'
  ORDER BY
    movies.title
  SQL
end

# 3. For each film released in 2000 or later in which 'Christopher
#    Walken' has appeared, list the movie title and the year. Order by
#    movie title.
def christopher_walken_21st_century_films
  MovieDatabase.execute(<<-SQL)
    SELECT
      movies.title, yr 
    FROM
      actors
      JOIN castings ON castings.actor_id = actors.id
      JOIN movies ON movies.id = castings.movie_id
    WHERE
      actors.name = 'Christopher Walken' AND yr > 1999
    ORDER BY
      movies.title
  SQL
end

# 4. List the films together with the leading star for all films
# produced in 1910. Order by movie title.
def leading_star_for_1910_films
  MovieDatabase.execute(<<-SQL)
  SELECT
    movies.title, actors.name
  FROM
    actors
      JOIN castings ON castings.actor_id = actors.id
      JOIN movies ON movies.id = castings.movie_id
  WHERE
    yr = 1910 AND ord = 1
  SQL
end

# 5. There is a film from 2012 in our database for which there is no
# associated casting information. Give the id and title of this movie.
def unknown_actors_2012
  MovieDatabase.execute(<<-SQL)
  SELECT
    movies.id, movies.title
  FROM
    movies 
      LEFT OUTER JOIN castings ON movies.id = castings.movie_id
  WHERE
    castings.actor_id IS NULL AND yr = 2012
  SQL
end

# 6. Which films have more than 60 roles? List the movie title and
# number of roles. Order by movie title.
### doesn't work atm cause 2 movies had duplicated ID

def big_movies
  MovieDatabase.execute(<<-SQL)
  SELECT
    movies.title, COUNT(castings.actor_id) AS roles
  FROM
    movies 
    JOIN castings ON movies.id = castings.movie_id
  GROUP BY 
    castings.movie_id
  HAVING
    COUNT(castings.actor_id) > 60
  SQL
end

# 7. List the movie year, movie title, and supporting actor (ord = 2)
# for all of the films in which Will Smith played the star role
# (ord = 1). Order by the name of the supporting actor.
def will_smith_supporting_actors
  MovieDatabase.execute(<<-SQL)
  SELECT
    movies.yr, movies.title, actors.name 
  FROM
    actors
      JOIN castings ON castings.actor_id = actors.id
      JOIN movies ON movies.id = castings.movie_id
  WHERE
    ord = 2 AND movies.title IN (
      SELECT
        movies.title 
      FROM
        actors
        JOIN castings ON castings.actor_id = actors.id
        JOIN movies ON movies.id = castings.movie_id
      WHERE
        actors.name = 'Will Smith' AND ord = 1
    )
    ORDER BY actors.name
  SQL
end

# 8. There is a movie in which 'Barrie Ingham' plays two roles. Write a
# query that returns the title of this movie.
def barrie_ingham_multiple_roles
  MovieDatabase.execute(<<-SQL)
  SELECT
    movies.id, movies.title
  FROM
    actors
      JOIN castings ON castings.actor_id = actors.id
      JOIN movies ON movies.id = castings.movie_id  
  GROUP BY 
    castings.actor_id 
  HAVING
    COUNT(castings.actor_id) = 2 AND actors.name = 'Barrie Ingham'
    
  SQL
end

