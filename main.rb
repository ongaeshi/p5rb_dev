def setup
  createCanvas(400, 400)
  colorMode(HSB, 360, 100, 100)
end

def draw_sayagata_pattern
  background(255)
  strokeWeight(2)

  size = 40
  rows = height / size
  cols = width / size

  rows.to_i.times do |i|
    cols.to_i.times do |j|
      x = j * size
      y = i * size

      hue = (i * 30 + j * 30) % 360
      fill(hue, 50, 100, 0.5) # Add fill color with some transparency
      stroke(hue, 50, 100)
      sayagata(x, y, size)
    end
  end
end

def sayagata(x, y, size)
  half = size / 2
  quarter = size / 4

  # Draw the Sayagata pattern
  beginShape
  vertex(x + quarter, y)
  vertex(x + quarter, y + half)
  vertex(x, y + half)
  vertex(x, y + size)
  vertex(x + half, y + size)
  vertex(x + half, y + half + quarter)
  vertex(x + size, y + half + quarter)
  vertex(x + size, y)
  vertex(x + half + quarter, y)
  vertex(x + half + quarter, y + half)
  vertex(x + size, y + half)
  vertex(x + size, y + size)
  vertex(x + half, y + size)
  vertex(x + half, y + half + quarter)
  vertex(x, y + half + quarter)
  vertex(x, y)
  vertex(x + half, y)
  vertex(x + half, y + quarter)
  vertex(x + size, y + quarter)
  vertex(x + size, y + half)
  vertex(x + half + quarter, y + half)
  vertex(x + half + quarter, y + size)
  vertex(x, y + size)
  vertex(x, y + half + quarter)
  vertex(x + quarter, y + half + quarter)
  vertex(x + quarter, y)
  endShape(CLOSE)
end

def draw
  draw_sayagata_pattern
end