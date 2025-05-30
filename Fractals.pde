PShader shader;

void setup() {
  fullScreen(P2D);
  pixelDensity(1);
  shader = loadShader("test.glsl");

}

void draw() {
  shader.set("resolution", float(width), float(height));
  shader.set("centerX", 0);
  shader.set("centerY", 0);
  shader.set("resX", 3.4);
  shader.set("resY", 2.0);
  shader.set("max_depth", 256);
  shader.set("real", (mouseX*2.0/width-1));
  shader.set("complex", (mouseY*2.0/height-1));
  shader(shader);
  rect(0, 0, width, height); 
}
