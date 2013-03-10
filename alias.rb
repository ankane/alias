$aliases = {}

def alias_exists?(name)
  $aliases[name] or system("type #{name} >/dev/null 2>&1")
end

def generate_alias(command)
  # try the first letter of each word
  words = command.downcase.split(/\s/)
  full_name = words.map{|w| w.split("/")[-1][0] }.select{|w| w =~ /[a-z]/ }.join

  # always return an alias, we'll ignore it if it's too long
  chars = 2
  name = full_name[0...chars]
  while alias_exists?(name)
    if chars <= full_name.length
      name = full_name[0...chars]
      chars += 1
    else
      name += name
    end
  end

  name
end

# count number of times each command appears
command_counts = Hash.new { |hash, key| hash[key] = 0 }
ARGF.each_line do |line|
  command = line[7..-2]
  command_counts[command] += 1
end

# generate aliases for the top 20 commands
command_counts.sort_by{|command, count| -1*count }.first(20).each do |command, count|
  if command.length > 4
    name = generate_alias(command)
    $aliases[name] = command if name.size < command.size
  end
end

puts "# Add these aliases to your profile"
$aliases.each do |a, command|
  puts "alias #{a}=\"#{command}\""
end
