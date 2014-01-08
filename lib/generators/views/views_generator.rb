require 'rails/generators'

module Views
  module Generators
    class ViewsGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      argument :framework_name, :type => :string, :default => "simple"

      # Add stylesheet for Devise views
      def add_devise_stylesheet
        dir = File.expand_path("../templates", __FILE__)
        case framework_name
          when 'none'
            # TODO
          when 'simple'
            # TODO
          when 'bootstrap2'
            # TODO
          when 'bootstrap3'
            append_file 'app/assets/stylesheets/framework_and_overrides.css.scss', File.read("#{dir}/bootstrap3.css.scss")
          when 'foundation4'
            # TODO
          when 'foundation5'
            append_file 'app/assets/stylesheets/framework_and_overrides.css.scss', File.read("#{dir}/foundation5.css.scss")
        end
      end

      # Add Devise views
      def add_devise_views
        copy_file 'sessions/new.html.erb', 'app/views/devise/sessions/new.html.erb'
      end

    end
  end
end
