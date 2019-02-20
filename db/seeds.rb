# Create initial todos

Todo.all.each do |todo|
  todo.destroy
end

t = Todo.new
t.name = "Go to the gym"
t.priority = "High"
t.done = false
t.save
p "Created Todo #{t.name}"

t = Todo.new
t.name = "Drink Water"
t.priority = "Medium"
t.done = true
t.save
p "Created Todo #{t.name}"

t = Todo.new
t.name = "Make my bed"
t.priority = "Low"
t.done = false
t.save
p "Created Todo #{t.name}"

t = Todo.new
t.name = "Send this video to Davis"
t.priority = "Low"
t.done = false
t.save
p "Created Todo #{t.name}"


