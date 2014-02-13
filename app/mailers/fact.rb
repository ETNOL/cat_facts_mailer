class Fact < ActionMailer::Base
	require 'json'


  default :from => "contactfivestarimports@gmail.com"
  default :to => "arielcmanley@gmail.com"


  def new_message(user_params)
  	@uri = 'http://catfacts-api.appspot.com/api/facts?number=1'
  	@response = Net::HTTP.get_response(uri)
  	@fact = JSON.parse @response.body
  	@fact = @fact["facts"].to_s.gsub(/[\[\]"]/, "")
    mail(:subject => "Your hourly cat fact has arrived!")
  end
end
