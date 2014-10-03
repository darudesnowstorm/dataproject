# Read data from file
f = File.new("data.dat","r")
data = f.readlines
f.close

# Format data so it can be used
goldcosts = data.collect do |goldcost|
	goldcost = goldcost.split("\t")
	goldcost[1].to_f
end

# Find the mean of the numbers
sum = 0 
amountofdata = goldcosts.length
goldcosts.each do |goldcost|
	sum = goldcost.to_f + sum
end
mean = sum / amountofdata

# Find the standard deviation
variances = goldcosts.collect do |goldcost|
	adn = goldcost.to_f - mean
	adn2 = (adn * adn)
end
sum2 = 0
variances.each do |dummy|
	sum2 = dummy.to_f + sum2
end
mean_sd = sum2 / amountofdata
standard_deviation = Math.sqrt(mean_sd)


# Find the z-scores
zscores = goldcosts.collect do |gold_cost|
	(gold_cost - mean) / standard_deviation
end

# Write converted data
g = File.new("zscores.dat","w")
g.puts(zscores)
g.close
puts "The mean of the data is " + mean.round(6).to_s + "."
puts "The standard deviation is approximately " + standard_deviation.round(6).to_s + "."
puts "The z-scores have been put into the 'zscores.dat' file."
