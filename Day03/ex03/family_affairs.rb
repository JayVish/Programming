#!/usr/bin/ruby
def find_the_gingers(family)
    ginger = []
    family.each do |name, color|
        if color== :red
            ginger.push(name)
        end
    end
    return ginger
end

Dupont_family = {
    "matthew" => :red,
    "mary" => :blonde,
    "virginia" => :brown,
    "gaetan" => :red,
    "fred" => :red,
}

p find_the_gingers Dupont_family