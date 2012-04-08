# RailsCasts Episode #54: Debugging Ruby (revised)

http://railscasts.com/episodes/54-debugging-ruby-revised

Requires Ruby 1.9.2 or higher.

### Commands used in Terminal

```
bundle
rails s
```

### Commands used in debugger

```
help
help list
list
next
pp @today_tasks
pp @today_tasks.map(&:due_at)
step
l
n
pp range
irb
continue
```

### Commands used in irb

```
puts where(due_at: range).to_sql
date.to_time
date.to_time_in_current_zone
range = date.beginning_of_day..date.end_of_day
exit
```
