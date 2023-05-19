# require 'vips'

namespace :app do
  task db: :environment do
    file_name = Rails.root.join('export', "app", "boolder.db")

    File.delete(file_name) if File.exist?(file_name)

    begin

      db = SQLite3::Database.new file_name

      db.execute <<-SQL
        create table problems (
          id INTEGER NOT NULL PRIMARY KEY,
          name TEXT, 
          name_en TEXT, 
          grade TEXT,
          latitude REAL NOT NULL,
          longitude REAL NOT NULL,
          circuit_id INTEGER,
          circuit_number TEXT,
          circuit_color TEXT,
          steepness TEXT NOT NULL,
          sit_start INTEGER NOT NULL,
          area_id INTEGER NOT NULL,
          bleau_info_id TEXT,
          featured INTEGER NOT NULL,
          popularity INTEGER,
          parent_id INTEGER
        );
        CREATE INDEX problem_idx ON problems(id);
        CREATE INDEX problem_area_idx ON problems(area_id);
        CREATE INDEX problem_circuit_idx ON problems(circuit_id);
        CREATE INDEX problem_grade_idx ON problems(grade);
      SQL

      Problem.joins(:area).where(area: { published: true }).find_each do |p|
        db.execute(
          "INSERT INTO problems (id, name, name_en, grade, latitude, longitude, circuit_id, circuit_number, 
          circuit_color, steepness, sit_start, area_id, bleau_info_id, 
          featured, popularity, parent_id)
          VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 
          [p.id, 
            I18n.with_locale(:fr) { p.name_with_fallback.presence }, 
            I18n.with_locale(:en) { p.name_with_fallback.presence }, 
            p.grade, p.location&.lat, p.location&.lon, 
            p.circuit_id_simplified, p.circuit_number_simplified.presence, p.circuit&.color, 
            p.steepness, p.tags.include?("sit_start") ? 1 : 0, p.area_id, p.bleau_info_id, 
            p.featured ? 1 : 0, p.popularity, p.parent_id]
        )
      end

      db.execute <<-SQL
        create table areas (
          id INTEGER NOT NULL PRIMARY KEY,
          name TEXT NOT NULL,
          description_fr TEXT,
          description_en TEXT,
          warning_fr TEXT,
          warning_en TEXT,
          tags TEXT,
          south_west_lat REAL NOT NULL,
          south_west_lon REAL NOT NULL,
          north_east_lat REAL NOT NULL,
          north_east_lon REAL NOT NULL,
          level1_count INTEGER NOT NULL,
          level2_count INTEGER NOT NULL,
          level3_count INTEGER NOT NULL,
          level4_count INTEGER NOT NULL,
          level5_count INTEGER NOT NULL,
          level6_count INTEGER NOT NULL,
          level7_count INTEGER NOT NULL,
          level8_count INTEGER NOT NULL,
          problems_count INTEGER NOT NULL
        );
        CREATE INDEX area_idx ON areas(id);
      SQL

      Area.published.each do |a|
        db.execute(
          "INSERT INTO areas (id, name, description_fr, description_en, warning_fr, warning_en, tags, south_west_lat, south_west_lon, north_east_lat, north_east_lon, 
                              level1_count, level2_count, level3_count, level4_count, level5_count, level6_count, level7_count, level8_count, problems_count)
          VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 
          [
            a.id, a.name.presence, 
            a.description_fr.presence, a.description_en.presence, 
            a.warning_fr.presence, a.warning_en.presence, 
            a.tags.join(",").presence,
            a.bounds[:south_west]&.lat, a.bounds[:south_west]&.lon, a.bounds[:north_east]&.lat, a.bounds[:north_east]&.lon,
            a.problems.level(1).count, a.problems.level(2).count, a.problems.level(3).count, a.problems.level(4).count, 
            a.problems.level(5).count, a.problems.level(6).count, a.problems.level(7).count, a.problems.level(8).count, 
            a.problems.count
          ]
        )
      end

      db.execute <<-SQL
        create table circuits (
          id INTEGER NOT NULL PRIMARY KEY,
          color TEXT NOT NULL,
          average_grade TEXT NOT NULL,
          beginner_friendly INTEGER NOT NULL,
          dangerous INTEGER NOT NULL,
          south_west_lat REAL NOT NULL,
          south_west_lon REAL NOT NULL,
          north_east_lat REAL NOT NULL,
          north_east_lon REAL NOT NULL
        );
        CREATE INDEX circuit_idx ON circuits(id);
      SQL

      Circuit.all.each do |c|
        db.execute(
          "INSERT INTO circuits (id, color, average_grade, beginner_friendly, dangerous, south_west_lat, south_west_lon, north_east_lat, north_east_lon)
          VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", 
          [c.id, c.color, c.average_grade, c.beginner_friendly? ? 1 : 0, c.dangerous? ? 1 : 0, 
            c.bounds[:south_west]&.lat, c.bounds[:south_west]&.lon, c.bounds[:north_east]&.lat, c.bounds[:north_east]&.lon
          ]
        )
      end

      db.execute <<-SQL
        create table pois (
          id INTEGER NOT NULL PRIMARY KEY,
          poi_type TEXT NOT NULL,
          name TEXT NOT NULL,
          short_name TEXT NOT NULL,
          google_url TEXT NOT NULL
        );
        CREATE INDEX poi_idx ON pois(id);
      SQL

      Poi.all.each do |p|
        db.execute(
          "INSERT INTO pois (id, poi_type, name, short_name, google_url)
          VALUES (?, ?, ?, ?, ?)", 
          [p.id, p.poi_type, p.name, p.short_name, p.google_url]
        )
      end


      db.execute <<-SQL
        create table poi_routes (
          id INTEGER NOT NULL PRIMARY KEY,
          area_id INTEGER NOT NULL,
          poi_id INTEGER NOT NULL,
          distance_in_minutes INTEGER NOT NULL,
          transport TEXT NOT NULL
        );
        CREATE INDEX poi_route_idx ON poi_routes(id);
        CREATE INDEX poi_route_area_idx ON poi_routes(area_id);
        CREATE INDEX poi_route_poi_idx ON poi_routes(poi_id);
      SQL

      PoiRoute.all.each do |pr|
        db.execute(
          "INSERT INTO poi_routes (id, area_id, poi_id, distance_in_minutes, transport)
          VALUES (?, ?, ?, ?, ?)", 
          [pr.id, pr.area_id, pr.poi_id, pr.distance_in_minutes, pr.transport]
        )
      end


      db.execute <<-SQL
        create table lines (
          id INTEGER NOT NULL PRIMARY KEY,
          problem_id INTEGER NOT NULL,
          topo_id INTEGER NOT NULL,
          coordinates TEXT
        );
        CREATE INDEX line_idx ON lines(id);
        CREATE INDEX line_problem_idx ON lines(problem_id);
        CREATE INDEX line_topo_idx ON lines(topo_id);
      SQL

      Line.joins(:problem => :area).joins(:topo).where(area: { published: true }, topo: { published: true }).find_each do |l|
        db.execute(
          "INSERT INTO lines (id, problem_id, topo_id, coordinates)
          VALUES (?, ?, ?, ?)", 
          [l.id, l.problem_id, l.topo_id, l.coordinates.to_json]
        )
      end

      puts "exported boolder.db".green

    rescue SQLite3::Exception => e 
      puts "Exception occurred".red
      puts e
    ensure
      db.close if db
    end
  end

  task topos: :environment do
    area_id = ENV["area_id"]
    raise "please specify an area_id" unless area_id.present?

    puts "exporting area #{area_id}"

    Line.published.joins(:problem).where(problems: { area_id: area_id }).each do |line|
      puts "processing photo for line ##{line.id}"
      output_file = Rails.root.join('export', 'app', "topos", "area-#{area_id}", "topo-#{line.topo.id}.jpg").to_s

      if File.exist?(output_file)
        puts "topo-#{line.topo.id}.jpg already exists"
      else
        # FIXME: iterate on topos (not lines) to avoid double processing
        line.topo.photo.open do |file| 
          im = Vips::Image.new_from_file file.path.to_s
          im.thumbnail_image(800).write_to_file output_file
        end

        puts "created topo-#{line.topo.id}.jpg"
      end
    end
    puts "exported topos for area ##{area_id}".green
  end

  # task covers: :environment do
  #   Area.order(:id).all.each do |area|
  #     puts "processing area ##{area.id}"

  #     output_file = Rails.root.join('export', 'app', "area-covers", "area-cover-#{area.id}.jpg").to_s
  #     area.cover.open do |file| 
  #       im = Vips::Image.new_from_file file.path.to_s
  #       im.thumbnail_image(400).write_to_file output_file
  #     end
  #   end

  #   puts "exported covers".green
  # end
end