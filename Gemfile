# A sample Gemfile
source "https://rubygems.org"

gem "sinatra"           # because we love 'Strangers in the Night'
gem "sinatra-contrib"   # reloader fo' real
gem "thin"              # just a webserver baby
gem "data_mapper"       # to erm... map the data

group :production do
  gem "pg"                    # we'll store here
  gem "dm-postgres-adapter"   # PSQL adapter for DataMapper
end

group :development do
  gem "sqlite3"            # we'll store here
  gem "dm-sqlite-adapter"  # SQLite adapter for DataMapper

end
