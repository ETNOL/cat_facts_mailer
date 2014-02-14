class Fact < ActionMailer::Base
	require 'json'
  require 'net/http'

  default :from => "catfactsservicer@gmail.com"
  default :to => "barryoppenheim@orlandohyundai.com"


  def new_message(user_params={})
  	@uri = URI('http://catfacts-api.appspot.com/api/facts?number=1')
  	@response = Net::HTTP.get_response(@uri)
  	@fact = JSON.parse @response.body
  	@fact = @fact["facts"]
    @fact = @fact.to_s.gsub(/[\[\]"]/, "")
    mail(:subject => "Your hourly cat fact has arrived!")
  end
end
