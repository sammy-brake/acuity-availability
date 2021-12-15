require 'net/http'
require 'uri'


#google interview
cal_ids = 
[
6178709,
6104625,
5954076]

cal_ids.each {  |c|
dates = ["2021-12-19", "2021-12-20","2021-12-21", "2021-12-22","2021-12-23", "2021-12-24","2021-12-25", "2021-12-26","2021-12-27", "2021-12-28","2021-12-29", "2021-12-30","2021-12-31", "2021-01-01"]
  dates.each { |d|
    

    uri = URI.parse("https://acuityscheduling.com/api/v1/availability/times?appointmentTypeID=3660432&calendarID=#{c}&date=#{d}")
    request = Net::HTTP::Get.new(uri)
    request.basic_auth(x,x)

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    puts response.body if response.is_a?(Net::HTTPSuccess)
  }
}

