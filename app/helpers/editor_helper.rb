module EditorHelper
  def slideshow_images_for(event)
    event.pictures.sort { |pic_1, pic_2| pic_1.order <=> pic_2.order }.map { |pic| pic if pic.image_url }.compact
  end

  def fonts_for_select
    [
      ['Lobster',      "'Lobster', cursive"],
      ['Quattrocento', "'Quattrocento Sans', sans-serif"],
      ['Lobster',      "'Lobster', cursive"],
      ['Vibur',        "'Vibur', cursive"],
      ['Fanwood Text', "'Fanwood Text', serif"],
      ['Six Caps',     "'Six Caps', sans-serif"],
      ['Rozha',        "'Rozha One', serif"],
      ['Julius',       "'Julius Sans One', sans-serif"]
    ]
  end

  def background_urls
    [
      "https://s3-eu-west-1.amazonaws.com/events-assets-static/backgrounds/diagonal_striped_brick.png",
      "https://s3-eu-west-1.amazonaws.com/events-assets-static/backgrounds/swirl_pattern.png",
      "https://s3-eu-west-1.amazonaws.com/events-assets-static/backgrounds/wavegrid.png",
      "https://s3-eu-west-1.amazonaws.com/events-assets-static/backgrounds/whitediamond.png",
      "https://s3-eu-west-1.amazonaws.com/events-assets-static/backgrounds/p1.png",
      "https://s3-eu-west-1.amazonaws.com/events-assets-static/backgrounds/p2.png",
      "https://s3-eu-west-1.amazonaws.com/events-assets-static/backgrounds/p3.png",
      "https://s3-eu-west-1.amazonaws.com/events-assets-static/backgrounds/p4.png",
      "https://s3-eu-west-1.amazonaws.com/events-assets-static/backgrounds/p5.png",
      "https://s3-eu-west-1.amazonaws.com/events-assets-static/backgrounds/p6.png",
      "https://s3-eu-west-1.amazonaws.com/events-assets-static/backgrounds/p7.png",
      "https://s3-eu-west-1.amazonaws.com/events-assets-static/backgrounds/p8.png",
      "https://s3-eu-west-1.amazonaws.com/events-assets-static/backgrounds/p9.png",
      "https://s3-eu-west-1.amazonaws.com/events-assets-static/backgrounds/p10.png"
    ]
  end

  OPTIONS = "<option value='1'>-12:00, International Date Line West</option><option value='2'>-11:00, Coordinated Universial Time</option><option value='3'>-10:00, Hawaii</option><option value='4'>-09:00, Alaska</option><option value='5'>-08:00, Baja California</option><option value='6'>-08:00, Pacific Time (US &amp; Canada)</option><option value='7'>-07:00, Arizona</option><option value='8'>-07:00, Chihuahua, La Paz, Mazatlan</option><option value='9'>-07:00, Mountain Time US &amp; Canada</option><option value='10'>-06:00, Central America</option><option value='11'>-06:00, Central Time US &amp; Canada</option><option value='12'>-06:00, Guadalajara, Mexico City, Monterrey</option><option value='13'>-06:00, Saskatchewan</option><option value='14'>-05:00, Bogota, Lima, Quito</option><option value='15'>-05:00, Eastern time US &amp; Canada</option><option value='16'>-05:00, Indiana (East)</option><option value='17'>-04:30, Caracas</option><option value='18'>-04:00, Asuncion</option><option value='19'>-04:00, Atlancic Time (Canada)</option><option value='20'>-04:00, Cuiaba</option><option value='21'>-04:00, Georgetown, La Paz, Manaus, San Juan</option><option value='22'>-04:00, Santiago</option><option value='23'>-03:30, Newfoundland</option><option value='24'>-03:00, Brasilia</option><option value='25'>-03:00, Buenos Aires</option><option value='26'>-03:00, Cayenne, Fortaleza</option><option value='27'>-03:00, Greenland</option><option value='28'>-03:00, Montevideo</option><option value='29'>-03:00, Salvador</option><option value='30'>-02:00, Coordinated Universal Time-02</option><option value='31'>-02:00, Mid-Atlantic</option><option value='32'>-01:00, Azores</option><option value='33'>-01:00, Cape Verde Is.</option><option value='34'>00:00, Casablanca</option><option value='35'>00:00, Coordinated Universal Time</option><option value='36'>00:00, Dublin, Edinburgh, Lisbon, London</option><option value='37'>00:00, Monrovia, Reykjavik</option><option value='38'>+01:00, Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna</option><option value='39'>+01:00, Belgrade, Bratislava, Budapest, Ljubljana, Prague</option><option value='40'>+01:00, Brussels, Copenhagen, Madrid, Paris</option><option value='41'>+01:00, Sarajevo, Skopje, Warsaw, Zagreb</option><option value='42'>+01:00, West Central Africa</option><option value='43'>+01:00, Windhoek</option><option value='44'>+02:00, Amman</option><option value='45'>+02:00, Athens, Bucharest</option><option value='46'>+02:00, Beirut</option><option value='47'>+02:00, Cairo</option><option value='48'>+02:00, Damascus</option><option value='49'>+02:00, Harare, Pretoria</option><option value='50'>+02:00, Helsinki, Kyiv, Riga, Sofia, Tallinn, Vilnius</option><option value='51'>+02:00, Istanbul</option><option value='52'>+02:00, Jerusalem</option><option value='53'>+02:00, Nicosia</option><option value='54'>+03:00, Baghdad</option><option value='55'>+03:00, Kaliningrad, Minsk</option><option value='56'>+03:00, Kuwait, Riyadh</option><option value='57'>+03:00, Nairobi</option><option value='58'>+03:30, Tehran</option><option value='59'>+04:00, Abu Dhabi, Muscat</option><option value='60'>+04:00, Baku</option><option value='61'>+04:00, Moscow, St. Petersburg, Volgograd</option><option value='62'>+04:00, Port Louis</option><option value='63'>+04:00, Tbilisi</option><option value='64'>+04:00, Yerevan</option><option value='65'>+04:30, Kabul</option><option value='66'>+05:00, Islamabad, Karachi</option><option value='67'>+05:00, Tashkent</option><option value='68'>+05:30, Chennai, Kolkata, Mumbai, New Dehli</option><option value='69'>+05:30, Sri Jayawardenepura</option><option value='70'>+05:45, Kathmandu</option><option value='71'>+06:00, Astana</option><option value='72'>+06:00, Dhaka</option><option value='73'>+06:00, Ekaterinburg</option><option value='74'>+06:30, Yangon (Rangoon)</option><option value='75'>+07:00, Bangkok, Hanoi, Jakarta</option><option value='76'>+07:00, Novosibirsk</option><option value='77'>+08:00, Beijing, Chongqing, Hong Kong, Urumqi</option><option value='78'>+08:00, Krasnoyarsk</option><option value='79'>+08:00, Kaula Lumpur, Singapore</option><option value='80'>+08:00, Perth</option><option value='81'>+08:00, Taipei</option><option value='82'>+08:00, Ulaanbaatar</option><option value='83'>+09:00, Irkutsk</option><option value='84'>+09:00, Osaka, Sapporo, Tokyo</option><option value='85'>+09:00, Seoul</option><option value='86'>+09:30, Adelaide</option><option value='87'>+09:30, Darwin</option><option value='88'>+10:00, Brisbane</option><option value='89'>+10:00, Canberra, Melbourne, Sydney</option><option value='90'>+10:00, Guam, Port Moresby</option><option value='91'>+10:00, Hobart</option><option value='92'>+10:00, Yakutsk</option><option value='93'>+11:00, Solomon Is., New Caledonia</option><option value='94'>+11:00, Vladvistok</option><option value='95'>+12:00, Auckland, Wellington</option><option value='96'>+12:00, Coordinated Universal Time +12</option><option value='97'>+12:00, Fiji</option><option value='98'>+12:00, Magadan</option><option value='99'>+13:00, Naku'alofa</option><option value='100'>+13:00, Samoa</option>"
  def time_zones_options_string(selection)
    pattern = "value='#{selection}'"
    OPTIONS.gsub pattern, "#{pattern} selected"
  end
end