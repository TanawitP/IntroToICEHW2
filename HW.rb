require 'csv'
data = CSV.read ('data.csv')
puts "Show all data"
puts data
puts " "
mean = 0.0
score = Array.new(data.length-1) 
colorname = Array.new(data.length-1)


puts "**********************************************************"
puts "Please choose the Question number"
puts "**********************************************************"
puts "1. Which student has the highest score in the class? Lowest?!"
puts "2. What is the mean of all student’s scores?!"
puts "3. What is the most popular color among students? Least popular?!"
puts "4. Capitalize the last letter of first name and last name, and lowercase the first letter of first"
puts ""

choose = gets.chomp.to_i



for i in 1...data.length
	colorname[i-1]=data[i][2]
end

for i in 1...data.length
	score[i-1]=data[i][1]
end


if choose==1 
	for i in 1...data.length
		if score.max == data[i][1] 
			print "Highest Score Student is "
			print data[i][0]
			puts "."
		end
	end

	for i in 1...data.length
		if score.min == data[i][1] 
			print "Lowest Score Student is "
			print data[i][0]
			puts "."
		end
	end
elsif choose ==2
	for i in 1...data.length
		mean=score[i-1].to_f+mean
	end
	mean = mean/5.0

	print "The mean of the scores is "
	print mean
	puts "."

elsif choose ==3
	count = Hash.new(0)
	colorname.each {|word| count[word] += 1}
	topColor, trash = count.first
	puts "**********************************************************"
	print "Most Favourite Color: " 
	puts topColor
	leastColor, trash = count.to_a.last
	print "Least Favourite Color: " 
	puts leastColor;
	puts "**********************************************************"
else
	puts "**********************************************************"
	for i in 1...data.length
		
		puts data[i][0].reverse.split(/\b/).map(&:capitalize).join.reverse
		
	end
	puts "**********************************************************"
end






