require 'json'

RSpec.describe InfoParser do
  
  before(:all) do
    file = File.read('collection.json')
    @json_info = JSON.parse(file)
  end
  
  it "check if file exists and is file" do
    expect(File).not_to exist("/collection.json")
  end
  
  it "checking if phone number is empty" do
    phone_number = @json_info["data"]['attributes']['contact-number']
    expect(phone_number).to_not eq ""
  end
  
  it "checking if email address is empty" do
    email_address = @json_info["data"]['attributes']['email-address']
    expect(email_address).to_not eq ""
  end
  
  it "checking if complete name including title is empty" do
    title = @json_info["data"]['attributes']['title']
    first_name = @json_info["data"]['attributes']['first-name']
    last_name = @json_info["data"]['attributes']['last-name']
    expect(title+" "+first_name+" "+last_name).to_not eq ""
  end
  
  it "checking if product name is empty" do
    product_name = @json_info['included'].last['attributes']['name']
    expect(product_name).to_not eq ""
  end
  
  

end