def setup
  createCanvas(710, 400)
end

def draw
  background(100, 153, 0)
  
  translate(width / 2, height / 2)
  rotate(frameCount * 0.01)
  translate(-width / 2, -height / 2)
  
  # Draw face
  fill(255, 224, 189)
  ellipse(355, 200, 150, 200)

  # Draw eyes
  fill(0)
  ellipse(330, 180, 20, 20)
  ellipse(380, 180, 20, 20)

  # Draw mouth
  noFill()
  arc(355, 240, 50, 30, 0, PI)
end
