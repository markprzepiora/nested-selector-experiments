#!/usr/bin/env ruby

MyRand = Random.new(1)

def rand(*args)
  MyRand.rand(*args)
end

def rand_px(limit = 30)
  "#{rand(1..limit)}px"
end

def rand_px_2
  [rand_px, rand_px].join(" ")
end

def rand_px_4
  [rand_px, rand_px, rand_px, rand_px].join(" ")
end

def rand_color
  "rgb(#{rand(1..255)}, #{rand(1..255)}, #{rand(1..255)})"
end

def rand_direction
  if rand < 0.25
    "top"
  elsif rand < 0.25
    "right"
  elsif rand < 0.25
    "bottom"
  else
    "left"
  end
end

def write_rules(suffix, nested)
  name = ".component-#{suffix}"
  separator = nested ? " " : "-"

  puts <<-CSS
    #{name} {
      margin: #{rand_px_4};
      padding: #{rand_px_4};
      color: #{rand_color};
      background-color: #{rand_color};

      border-#{rand_direction}: #{rand_px(5)} solid #{rand_color};
      border-#{rand_direction}: #{rand_px(5)} solid #{rand_color};
      border-#{rand_direction}: #{rand_px(5)} solid #{rand_color};
    }

    #{name}#{separator}ul {
      margin: #{rand_px_4};
      padding: #{rand_px_4};
      color: #{rand_color};
      background-color: #{rand_color};
    }

    #{name}#{separator}ul#{separator}li {
      margin: #{rand_px_4};
      padding: #{rand_px_4};
      color: #{rand_color};
      background-color: #{rand_color};
    }

    #{name}#{separator}ul#{separator}li#{separator}a {
      margin: #{rand_px_4};
      padding: #{rand_px_4};
      color: #{rand_color};
      background-color: #{rand_color};
    }

    #{name}#{separator}ul#{separator}li#{separator}span {
      margin: #{rand_px_4};
      padding: #{rand_px_4};
      color: #{rand_color};
      background-color: #{rand_color};
    }

  CSS
end

nested = ARGV[0] == "nested"

(1..100).each do |i|
  write_rules(i, nested)
end
