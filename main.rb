# p5.rb のソースコードです。
# p5.rb は p5.js の Ruby 版です。メソッド名や引数は p5.js と同じです。

def setup
  createCanvas(400, 400)
  background(255)
end

def draw
  stroke(0)
  line(0, 0, width, height)
  fill(150)
  ellipse(200, 200, 50, 50)

  fill(100)
  rect(50, 50, 100, 100)

  fill(200)
  triangle(300, 100, 350, 200, 250, 200)
end