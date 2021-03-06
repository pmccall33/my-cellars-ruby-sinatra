configure :production, :development do

  db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/wine_cellar_db')
  url = URI.parse(ENV['SERVER_URL'] || 'http://localhost:8080')

  ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )

end