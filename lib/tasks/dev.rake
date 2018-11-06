namespace :dev do 

  task fetch_todo: :environment do
    Todo.destroy_all

    i = 1

    30.times do
      todo = Todo.create!(
        title: "todo #{i}",
        done: false
        )
      i += 1
    end

    puts "Now you have #{Todo.count} todos data"
  end

end