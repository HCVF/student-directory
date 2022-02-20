def read_self
  File.open($0, "r") do |file|
    puts $1
    file.readlines.each do |line|
      puts line
    end
  end
end

read_self