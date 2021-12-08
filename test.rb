
require 'uri'
require 'net/http'

uri = URI("https://acuityscheduling.com/api/v1/availability/times?appointmentTypeID=3660432&calendarID=5691422&date=2021-12-12")
res = Net::HTTP.get_response(uri)
res.basic_auth("13978840", "57085eb1547bf6003d83b3ded4f16d33")
res.content_type = "application/json"
puts res.body if res.is_a?(Net::HTTPSuccess)

