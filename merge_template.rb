#! /usr/bin/env ruby

require_relative('profile_maker')

# set variables for the directory paths
this_dir = File.dirname(__FILE__)
site_dir = File.join(this_dir, 'site')
assets_dir = File.join(site_dir, '_assets')
target_dir = File.join(site_dir, 'profiles')

csv_file = 'profile.csv'
template_file = 'index.html.erb'
target_file = "index.html"

# create a new ProfileMaker class
pm = ProfileMaker.new

# add the template
template_path = File.join(assets_dir, template_file)
pm.add_template(template_path)

# add the course data
csv_path = File.join(assets_dir, csv_file)
pm.add_profile_data(csv_path)

# render the output and capture in a variable
content = pm.render
#puts content

output_path = File.join(target_dir, target_file)
File.open(output_path, 'w+') do |f|
  f.write(content)
end
