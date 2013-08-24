require_relative '../models/task.rb'

def list
	Task.all.map {|row| "#{row.id}. #{row.completeness} #{row.description}"}
end

def add_item(task)
	Task.create(description: task)
end

def delete_item(id)
	task_text = task_by(id).description
	task_by(id).destroy
	task_text
end

def complete_item(id)
	task_by(id).update(:completeness => 'X')
end

def uncomplete_item(id)
	task_by(id).update(:completeness => '-')
end

def task_by(id)
	Task.find_by_id(id)
end

if ARGV.any?

	command = ARGV[0]
	args = ARGV[1..-1]

  if command == "list"
  	puts list
 
  elsif command == "add"
    task = args.join(" ")
    add_item(task)
    puts "Appended \"#{task}\" to your TODO list..."
 
  elsif command == "delete"
  	task_text = delete_item(args)
  	puts "Deleted \"#{task_text}\" from your TODO list..."
 
  elsif command == "complete"
  	complete_item(args)
 
  elsif command == "uncomplete"
    uncomplete_item(args)
  end

end
