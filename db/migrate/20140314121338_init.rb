class Init < ActiveRecord::Migration
  def up
    execute """
    CREATE TABLE area (
      id INTEGER PRIMARY KEY,
      name VARCHAR(120),
      sources TEXT
    )
    """
    execute """
    CREATE TABLE office (
      id INTEGER PRIMARY KEY,
      name VARCHAR(120)
    )
    """
    execute """
    CREATE TABLE job (
      id INTEGER PRIMARY KEY,
      area INTEGER REFERENCES area(id),
      office INTEGER REFERENCES office(id),
      date TIMESTAMP,
      title VARCHAR(1024)
    )
    """
  end

  def down
    execute 'DROP TABLE job'
    execute 'DROP TABLE office'
    execute 'DROP TABLE area'
  end
end
