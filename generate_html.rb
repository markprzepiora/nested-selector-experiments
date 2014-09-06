#!/usr/bin/env ruby

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

def write_component(suffix)
  name = "component-#{suffix}"

  puts <<-HTML
    <div class="#{name}">
      <ul>
        <li><a href="#">A link</a> Some text <span>Some text in a span</span></li>
        <li><a href="#">A link</a> Some text <span>Some text in a span</span></li>
        <li><a href="#">A link</a> Some text <span>Some text in a span</span></li>
        <li><a href="#">A link</a> Some text <span>Some text in a span</span></li>
        <li><a href="#">A link</a> Some text <span>Some text in a span</span></li>
        <li><a href="#">A link</a> Some text <span>Some text in a span</span></li>
        <li><a href="#">A link</a> Some text <span>Some text in a span</span></li>
        <li><a href="#">A link</a> Some text <span>Some text in a span</span></li>
        <li><a href="#">A link</a> Some text <span>Some text in a span</span></li>
        <li><a href="#">A link</a> Some text <span>Some text in a span</span></li>
        <li><a href="#">A link</a> Some text <span>Some text in a span</span></li>
        <li><a href="#">A link</a> Some text <span>Some text in a span</span></li>
        <li><a href="#">A link</a> Some text <span>Some text in a span</span></li>
        <li><a href="#">A link</a> Some text <span>Some text in a span</span></li>
        <li><a href="#">A link</a> Some text <span>Some text in a span</span></li>
      </ul>
    </div>
  HTML
end

puts <<-HTML
  <link rel="stylesheet" type="text/css" href="nested.css">
HTML

(1..10000).each do |i|
  number = rand(1..100)
  write_component(number)
end
