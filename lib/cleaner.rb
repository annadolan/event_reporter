module Cleaner
  def clean_first_name(first_name)
    first_name
      .to_s
      .gsub(/[^a-zA-Z ]/, '')
      .split(/\s/)
      .map(&:capitalize)
      .join(" ")
  end

  def clean_last_name(last_name)
    last_name
      .to_s
      .gsub(/[^a-zA-Z]/, '')
      .split(/\s/)
      .map(&:capitalize)
      .join
  end

  def clean_email(email_address)
    email_address
      .to_s
  end

  def clean_phone(homephone)
    homephone
      .to_s
      .gsub(/[^0-9]/, '')
      .rjust(10, "0")[0..9]
  end

  def clean_street(street)
    street
      .to_s
      .split(/\s/)
      .map(&:capitalize)
      .join(" ")
  end

  def clean_city(city)
    city
      .to_s
      .gsub(/[^a-zA-Z ]/, '')
      .split(/\s/)
      .map(&:capitalize)
      .join(" ")
  end

  def clean_state(state)
    state
      .to_s
      .gsub(/[^a-zA-Z]/, '')
      .split(/\s/)
      .map(&:upcase)
      .join
  end

  def clean_zipcode(zipcode)
    zipcode
      .to_s
      .gsub(/[^0-9]/, '')
      .rjust(5,"0")[0..4]
  end
end
