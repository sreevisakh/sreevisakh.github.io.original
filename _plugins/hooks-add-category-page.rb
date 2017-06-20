module Jekyll
  class CategoryPage < Page
    def initialize(site, base, dir, category)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'category_index.html')
      self.data['category'] = category

      self.data['title'] = category
    end
  end

  class CategoryPageGenerator < Generator
    def generate(site)
      if site.layouts.key? 'category_index'
        site.categories.each_key do |category|
          dir = category
          site.pages << CategoryPage.new(site, site.source, File.join(dir), category)
        end
      end
    end
  end
end
