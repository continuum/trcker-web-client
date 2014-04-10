
# Change Compass configuration
compass_config do |config|
  # routes for stylesheets directories at build mode
  config.sass_options = {:output_style => :nested,
    :images_dir => 'images', :fonts_dir => 'fonts'}
end

Encoding.default_external = 'utf-8'

# for physical directories at development mode
set :images_dir,  "images"
set :fonts_dir,  "fonts"
set :css_dir,  "stylesheets"
set :js_dir, "javascripts"

set :markdown, :layout_engine => :haml

set :default_encoding, 'utf-8'
activate :i18n, :mount_at_root => :es

# Build-specific configuration

configure :build do
  activate :compass

  activate :minify_css
  activate :minify_javascript

  # Use relative URLs
  activate :relative_assets

  # Enable cache buster
  # activate :cache_buster

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  #set :http_path, "./"
end

MiddlemanEmber::HandlebarsTemplate.options = {
  template_path: "app/templates"
}
