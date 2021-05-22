require 'pg'

class Peep
  def self.all
    dbname = ENV['ENVIRONMENT'] == 'test' ? 'chitter_test' : 'chitter'
    connection = PG.connect(dbname: dbname)
    response = connection.exec('SELECT * FROM peeps;')
    response.map { |peep| peep['text'] }
  end

  def self.create(text:)
    dbname = ENV['ENVIRONMENT'] == 'test' ? 'chitter_test' : 'chitter'
    connection = PG.connect(dbname: dbname)
    response = connection.exec("INSERT INTO peeps (text) VALUES ('#{text}');")
  end
end