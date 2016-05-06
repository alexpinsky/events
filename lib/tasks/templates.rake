namespace :templates do

  namespace :wedding do

    task create: :environment do
      Rake::Task['templates:wedding:simple:create'].execute
      Rake::Task['templates:wedding:paris:create'].execute
      Rake::Task['templates:wedding:colaze:create'].execute
      Rake::Task['templates:wedding:c_tree:create'].execute
    end

    namespace :simple do

      task create: :environment do
        Event.create!(
          template: Template.simple,
          state: Event::STATES.template,
          name: 'simple',
          url: 'simple',
          appearance: {
            background: { type: :color, color: 'white' }
          }
        )
      end
    end

    namespace :paris do

      task create: :environment do
        Event.create!(
          template: Template.paris,
          state: Event::STATES.template,
          name: 'paris',
          url: 'paris',
          appearance: {
            background: { type: :color, color: 'white' }
          }
        )
      end
    end

    namespace :colaze do

      task create: :environment do
        Event.create!(
          template: Template.colaze,
          state: Event::STATES.template,
          name: 'colaze',
          url: 'colaze',
          appearance: {
            background: { type: :color, color: 'white' }
          }
        )
      end
    end

    namespace :c_tree do

      task create: :environment do
        Event.create!(
          template: Template.c_tree,
          state: Event::STATES.template,
          name: 'c_tree',
          url: 'c_tree',
          appearance: {
            background: { type: :color, color: 'white' }
          }
        )
      end
    end
  end
end
