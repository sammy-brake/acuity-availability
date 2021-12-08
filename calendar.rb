require 'net/http'
require 'uri'

cal_ids = [6196470,6248041,5993631,5700153,5802945,6104777,5725799,6104589,5660256,6104625,5664024,5562197,5725775,6104716,5691422,5709781,6105290,5685538,5659311,5602235,4521385,3960320,3864502,4116796,5849923,5779201,5774185,5774080,5685605,5668951,5803386,5886948,4621415,5760141,5922494,5877543,5954076,5710426]

cal_ids.each {  |c|
uri = URI.parse("https://acuityscheduling.com/api/v1/availability/times?appointmentTypeID=3660432&calendarID=#{c}&date=2021-12-10")
request = Net::HTTP::Get.new(uri)
request.basic_auth("13978840", "57085eb1547bf6003d83b3ded4f16d33")

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

puts response.body if response.is_a?(Net::HTTPSuccess)

}

