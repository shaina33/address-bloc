def greeting
    ARGV.each do |arg|
        unless ARGV.index(arg) == 0
            puts "#{ARGV[0]} #{arg}"
        end
    end
end

greeting