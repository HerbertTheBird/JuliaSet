
#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 resolution;
uniform float centerX;
uniform float centerY;
uniform float resX;
uniform float resY;
uniform int max_depth;
uniform float real;
uniform float complex;

void main() {
 vec2 uv = gl_FragCoord.xy / resolution;
 float originalReal, originalComplex;
 if(real == 0.0 && complex == 0.0){
  originalReal = (uv.x-0.5)*resX+centerX;
  originalComplex = (uv.y-0.5)*resY+centerY;
 }
 else{
  originalReal = real;
  originalComplex = complex;
 }
 float sreal = (uv.x-0.5)*resX+centerX;
 float scomplex = (uv.y-0.5)*resY+centerY;
 float newReal, newComplex;
 int i;
 for(i = 0; i < 256; i++){
  if(i >= max_depth) break;
  newReal = sreal*sreal-scomplex*scomplex+originalReal;
  newComplex = 2*sreal*scomplex+originalComplex;
  sreal = newReal;
  scomplex = newComplex;
  if(sreal*sreal+scomplex*scomplex > 10) break;
 }
 if(i == max_depth || i == 256) gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);
 else{
  float color = min(1.0, (float(i)/32.0));
  gl_FragColor = vec4(0.0, 0.0, color, 1.0);
 }
}
