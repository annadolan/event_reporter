require "./lib/cleaner"

class DataCleaner
  include Cleaner

  def clean_data(contents)
    cleaned = {}
    contents.each_with_index do |row, i|
    first_name    = clean_first_name(row[:first_name])
    last_name     = clean_last_name(row[:last_name])
    email_address = clean_email(row[:email_address])
    homephone     = clean_phone(row[:homephone])
    street        = clean_street(row[:street])
    city          = clean_city(row[:city])
    state         = clean_state(row[:state])
    zipcode       = clean_zipcode(row[:zipcode])
    cleaned[i+1]  = {
                    "last_name"     => last_name,
                    "first_name"    => first_name,
                    "email_address" => email_address,
                    "zipcode"       => zipcode,
                    "city"          => city,
                    "state"         => state,
                    "street"        => street,
                    "homephone"     => homephone}
    end
    cleaned
  end
end
