# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
every :day, at: '12am' do
    runner "Subscription.check_expiry_dates"
end

every :hour do
    runner "Lesson.check_expiry"
end

# Learn more: http://github.com/javan/whenever
