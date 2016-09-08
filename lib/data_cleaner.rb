require "./lib/cleaner"

class DataCleaner
  include Cleaner
  def clean_data(contents)
    cleaned = {}
    contents.each_with_index do |row, i|
    first_name = clean_first_name(row[:first_name])
    last_name = clean_last_name(row[:last_name])
    email = clean_email(row[:email_address])
    phone = clean_phone(row[:homephone])
    street = clean_street(row[:street])
    city = clean_city(row[:city])
    state = clean_state(row[:state])
    zipcode = clean_zipcode(row[:zipcode])
    cleaned[i+1] = {"first_name" => first_name,
                    "last_name"  => last_name,
                    "email"      => email,
                    "home_phone" => phone,
                    "street"     => street,
                    "city"       => city,
                    "state"      => state,
                    "zipcode"    => zipcode}
    end
    cleaned
  end
end
