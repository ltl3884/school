namespace :school do
  desc "初始化数据"
  task :init_school => :environment do
    include Util::Http
    File.open("#{Rails.root}/lib/school.txt") do |file|
      file.each_line do |line|
        level = line.split(" ")[0]
        name = line.split(" ")[1]
        x = Xuexiao.find_or_initialize_by(name: name, level: level)
        next if x.l_name.present?
        url = "http://api.map.baidu.com/place/v2/search?query=#{name}&tag=教育培训&region=北京&output=json&ak=BVH2iKIP2V9a4MQbMwVIXrid4zdrPFlb"
        puts url
        exec_get(url) do |result|
          if result["results"].present?
            r = result["results"][0]
            x.l_name = r["name"]
            x.l_lat = r["location"]["lat"]
            x.l_lng = r["location"]["lng"]
            x.l_address = r["address"]
            x.area = "海淀"
            x.save
            sleep(2)
          end
        end
        
      end
    end
  end
end