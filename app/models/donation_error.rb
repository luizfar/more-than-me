class DonationError < StandardError
  attr_accessor :response
  def initialize(response)
    @response = response
  end
  def to_s
    "#{super}: #{response.inspect}"
  end
end
