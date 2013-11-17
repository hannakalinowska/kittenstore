namespace :kittenstore do
  desc "Run the twitter scraper"
  task :scrape => :environment do
    Scraper.run
  end
end
