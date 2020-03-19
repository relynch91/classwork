require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject

  def initialize(params = {})
    # ...
    
  end

  def self.columns

    table = self.table_name
    if @columns.nil?
      @columns ||= DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{table}
      SQL

      #debugger    
      @columns = @columns[0].map { |ele| ele.to_sym }
    else
      @columns
    end
  end

  def self.finalize!

  end

  def self.table_name=(name)
    @table_name = name
  end

  def self.table_name
    @table_name ||= self.name.tableize

  end

  def self.all
    # ...
    
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  

  def attributes
    # ...
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
