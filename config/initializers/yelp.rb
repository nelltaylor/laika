YELP = YAML.load_file('config/yelp.yml')[Rails.env].with_indifferent_access if Rails.env.development?