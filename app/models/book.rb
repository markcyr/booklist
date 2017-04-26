# There's an object in the Ruby standard library for manipulating CSV data
# It's not included by default when Rails starts, so we'll require it here.
require 'csv'

class Book < ActiveRecord::Base
  # This method is used to create a CSV representation of the data in the database
  # attr_accessible :name, :price, :released_on

    def self.to_csv
      CSV.generate do |csv|
        csv << column_names
        all.each do |book|
          csv << book.attributes.values_at(*column_names)
        end
      end
    end
end
