# RailsCasts Episode #344: Queue Classic

http://railscasts.com/episodes/344-queue-classic

Requires Ruby 1.9.2 or higher.

### Commands used in this episode

```
rails g migration add_queue_classic
rails g migration setup_queue_classic
rake db:migrate
rake qc:work
rails c
```


### Commands used in rails console

```
QC.enqueue "puts", "hello world"
QC.enqueue "puts", msg: "hello world"
QC.enqueue "puts", "msg" => "hello world"
```
