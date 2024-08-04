class Todo
  def initialize
    @todos = []
    @remove = []
    add_task
    delete_task
    update_Addfile
  end
  def add()
    print "enter number of tasks: "
    tasks = gets.chomp.to_i
    tasks.times do
      print "enter task : "
      task = gets.chomp!
      @todos << task
    end
    update_Addfile
  end


  def add_task
    if File.exist?('todos.txt')
       File.foreach('todos.txt') do |f|
        @todos << f.chomp
      end
    end
  end
  def update_Addfile
    File.open('todos.txt','w') do |f|
      @todos.each { |task| f.puts(task) }
    end
  end
  def delete_task
    if File.exist?('remove.txt')
      File.foreach('remove.txt') do |f|
        @remove << f.chomp
        @todos << f.chomp
      end
    end
  end
  def update_Removefile
    File.open('remove.txt','w') do |f|
      @remove.each { |task| f.puts(task) }
    end
  end


  def remove()
    print "enter the number of task you want to remove:"
    tasks =gets.chomp.to_i
    tasks.times do
    print "enter task to remove:"
    task = gets.chomp!
    if @todos.delete(task)
      @remove << task
      else
        puts "task not found"
      end
    end
    update_Addfile
    update_Removefile
  end
  
  def list
      if @todos.empty?
        puts "no task to display"
      else
        puts "Your todo list"
        @todos.each_with_index do |task , index|
        puts "#{index}:#{task}"
      end
    end
  end
  def show
    puts "Summary"
    puts "Completed task :#{@remove.count}"
    puts "Remaining task :#{@todos.count}"
    puts "Removed tasks: #{@remove.join(' , ')}" unless @remove.empty?
  end
end
todo = Todo.new
todo.add
todo.list
todo.remove
todo.list
todo.show

  
