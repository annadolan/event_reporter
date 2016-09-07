require "pry"
require "csv"
require "./lib/cleaner"
class ColumnDefiner

  def clean_data(contents)
    c = Cleaner.new
    cleaned = {}
    contents.each_with_index do |row, i|
    first_name = c.clean_first_name(row[:first_name])
    last_name = c.clean_last_name(row[:last_name])
    email = c.clean_email(row[:email_address])
    phone = c.clean_phone(row[:homephone])
    street = c.clean_street(row[:street])
    city = c.clean_city(row[:city])
    state = c.clean_state(row[:state])
    zipcode = c.clean_zipcode(row[:zipcode])
    cleaned[i+1] = {"first_name" => first_name,
                    "last_name"  => last_name,
                    "email"      => email,
                    "home_phone" => phone,
                    "street"     => street,
                    "city"       => city,
                    "state"      => state,
                    "zipcode"    => zipcode
                      }
      end
      cleaned
  end





end
