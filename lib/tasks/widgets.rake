namespace :widgets do
  desc "Delete all widgets"
  task delete_all: :environment do
    count = Widget.count
    Widget.delete_all
    puts "Deleted #{count} widgets"
  end
end
