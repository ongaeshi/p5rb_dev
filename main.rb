def setup
  createCanvas(710, 400)
end

def draw
  background(100, 150, 200)
  
  noFill()
  stroke(255, 204, 0)
  strokeWeight(3)

  (0..10).each do |i|
    translate(width / 2, height / 2)
    rotate(frameCount * 0.01)
    translate(-width / 2, -height / 2)
    ellipse(355, 200, 150 - i * 10, 200 - i * 20)
  end
end