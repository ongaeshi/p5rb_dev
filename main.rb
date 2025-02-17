# https://gainenz.com/2021/05/spirograph/

def setup
  createCanvas(640, 480)
  frameRate(20)
  background(255)
end

@r = 10
@theta = 0

def draw
  @theta += 10
  @r += 1
  line(@r * cos(radians(@theta)) + width / 2, @r * sin(radians(@theta)) + height / 2,
       @r * cos(radians(@theta) * 1.05) + width / 2, @r * sin(radians(@theta) * 1.05) + height / 2)
end
