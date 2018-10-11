module Slugifiable

    def slug
        self.name.downcase.gsub(" ", "-")
    end
    
    module ClassMethods

        def find_by_slug(slug)
            result = nil

            if !slug.empty?
                self.all.select do |obj|
                    if obj.name.downcase == slug.gsub("-", " ").split(" ").join(" ")
                        result = obj
                    end
                end
            end
            result
        end
    end
end
