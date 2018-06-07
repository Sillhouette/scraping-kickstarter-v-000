# require libraries/modules here
require 'nokogiri'

def create_project_hash
  # This just opens a file and reads it into a variable
  html = File.read('fixtures/kickstarter.html');

  kickstarter = Nokogiri::HTML(html);

  projects = {};

  kickstarter.css("li.project.grid_4").each do |project|
    projects[project] = {};
  end

  projects;
end

# projects: kickstarter.css("li.project.grid_4")
# title: project.css("h2."bbcard"")
# image: project.css("div.project-thumbnail a img").attribute("src").value
# description: project.css("p.bbcard_blurb").text
# location: project.css("span.location_name").text
# Percend funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i
