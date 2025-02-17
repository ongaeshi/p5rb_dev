def setup
  createCanvas(800, 800)
  colorMode(HSB, 360, 100, 100)
  background(255)
end

def draw
  background(255)

  (0..20).each do |i|
    (0..20).each do |j|
      fill((i * 18 + j * 18) % 360, 50, 100) # Pastel colors
      rect(i * 40, j * 40, 40, 40)
    end
  end

  (0..10).each do |i|
    fill((i * 36) % 360, 50, 100) # Pastel colors
    ellipse(width / 2, height / 2, i * 50, i * 50)
  end
end
