Rails.application.config.assets.precompile += %w( display.css )
Rails.application.config.assets.precompile += %w( display.js )
Rails.application.config.assets.precompile += %w( play.js )

# Precompile additional assets.
  # application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
  # config.assets.precompile += %w( display.js )
  # config.assets.precompile += %w( display.css )
  # config.assets.precompile << Proc.new do |path|
  #   if path =~ /\.(css|js)\z/
  #     full_path = Rails.application.assets.resolve(path).to_path
  #     app_assets_path = Rails.root.join('app', 'assets').to_path
  #     if full_path.starts_with? app_assets_path
  #       puts "including asset: " + full_path
  #       true
  #     else
  #       puts "excluding asset: " + full_path
  #       false
  #     end
  #   else
  #     false
  #   end
  # end