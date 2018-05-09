require "info_parser/version"
require 'json' 

module InfoParser
  class JsonFileParser
    #Reads and displays the information
    def self.parse_file(filename)
      json_values = self.read_file_and_pass_hash(filename)
      phone_number = json_values["data"]['attributes']['contact-number']
      email_address = json_values["data"]['attributes']['email-address']
      product_name = json_values["included"].last["attributes"]["name"]
      full_name = self.find_full_name(json_values)
      
      puts "Name           : #{full_name}"
      puts "Phone Number   : #{phone_number}"
      puts "Email Address  : #{email_address}"
      puts "Product Name   : #{product_name}"
    end
    
    #Reads the file and pass the values after decoding json
    def self.read_file_and_pass_hash filename
      extension = File.extname(filename)
      filename_with_ext = !extension.empty? ? filename : (filename.to_s + ".json")
      file = File.read(filename_with_ext)
      json_values = JSON.parse(file)
      return json_values
    end
    
    #Returns the full name of the user
    def self.find_full_name json_values
      title = json_values["data"]['attributes']['title'] 
      first_name = json_values["data"]['attributes']['first-name']
      last_name = json_values["data"]['attributes']['last-name']
      return ("#{title} #{first_name} #{last_name}")
    end
  end
end
