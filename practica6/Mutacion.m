function [ Pob ] = Mutacion( Pob,I,mut)
[R C] = size(Pob);

NumMut = round(mut*R*C/100.0);
for i = 1: NumMut
ix = ceil(C*rand);
iy = ceil(R*rand);
Pob(iy,ix) = I(ix,1) + rand()*(I(ix,2)-I(ix,1));
end
end