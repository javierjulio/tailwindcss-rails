require "rails"

module Tailwindcss
  class Engine < ::Rails::Engine
    class << self
      def globs
        Rails.application.config.assets.tailwind_paths.flat_map do |path|
          [
            "#{path}/public/*.html",
            "#{path}/app/helpers/**/*.rb",
            "#{path}/app/javascript/**/*.js",
            "#{path}/app/views/**/*.{erb,haml,html,slim}",
          ]
        end
      end
    end

    initializer "tailwindcss.assets" do
      Rails.application.config.assets.precompile += %w( inter-font.css )
      Rails.application.config.assets.tailwind_paths = [Rails.root]
    end

    initializer "tailwindcss.disable_generator_stylesheets" do
      Rails.application.config.generators.stylesheets = false
    end

    config.app_generators do |g|
      g.template_engine :tailwindcss
    end
  end
end
