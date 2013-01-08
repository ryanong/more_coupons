module GroupOn
  class Engine < ::Rails::Engine
    paths["app/engine_views"] = paths["app/views"]
    paths["app/views"] = []

    DOMAINS = [
      "groupon.com",
      "groupon.localhost"
    ]

    def self.locale
      :"EN-GROUPON"
    end

    I18n.fallbacks.map(self.locale => :en)

    def self.view_paths
      paths["app/engine_views"].map do |path|
        self.root.join(path)
      end
    end
  end
end
