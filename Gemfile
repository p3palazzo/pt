source "https://rubygems.org"
gem "jekyll", "~> 4.2"
# This is the default theme for new Jekyll sites.
# You may change this to anything you like.
gem "tufte-pandoc-jekyll"
# If you want to use GitHub Pages, remove the "gem "jekyll"" above and
# uncomment the line below. To upgrade, run `bundle update github-pages`.
# If you have any plugins, put them here!
group :jekyll_plugins do
  gem "jekyll-archives"
  gem "jekyll-data"
  gem "jekyll-feed"
  gem "jekyll-coffeescript"
  gem "jekyll-default-layout"
  gem "jekyll-gist"
  gem "jekyll-include-cache"
  gem "jekyll-optional-front-matter"
  #gem "jekyll-paginate"
  gem "jekyll-pandoc"
  gem "jekyll-scholar"
  gem "jekyll-relative-links"
  gem "jekyll-seo-tag"
  gem "jekyll-sitemap"
  gem "sassc"
  gem "stringex"
  gem "webrick"
end

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
install_if -> { RUBY_PLATFORM =~ %r!mingw|mswin|java! } do
  gem "tzinfo", "~> 1.2"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.1", :install_if => Gem.win_platform?

