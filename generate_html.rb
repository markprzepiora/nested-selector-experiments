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

def write_component(suffix, nested = true)
  name       = "component-#{suffix}"
  div_class  = name
  ul_class   = nested ? "" : "#{name}-ul"
  li_class   = nested ? "" : "#{name}-ul-li"
  a_class    = nested ? "" : "#{name}-ul-li-a"
  span_class = nested ? "" : "#{name}-ul-li-span"

  li = <<-HTML
    <li class="#{li_class}">
      <a href="#" class="#{a_class}">A link</a> Some text <span class="#{span_class}">Some text in a span</span>
    </li>
  HTML

  puts <<-HTML
    <div class="#{name}">
      <ul class="#{ul_class}">
        #{li*10}
      </ul>
    </div>
  HTML
end


nested   = ARGV[0] == "nested"
css_name = nested ? "nested.css" : "unnested.css"

puts <<-HTML
  <link rel="stylesheet" type="text/css" href="#{css_name}" />
  <div id="render-time"></div>
HTML

(1..5000).each do |i|
  number = rand(1..100)
  write_component(number, nested)
end
