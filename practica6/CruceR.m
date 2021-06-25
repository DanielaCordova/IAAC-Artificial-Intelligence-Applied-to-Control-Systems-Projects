function [ Pob_C ] = CruceR(Pob,V )
[R C]=size(Pob); Pob_C = zeros(R,C);
for i1 = 1:V
    t = randperm(R);
    f = reshape(t,R/2,2);
    idx = 1;
for i2 = 1:R/2
    beta1 = rand();
    beta2 = rand();
    aux1 = Pob(f(i2,1),i1) + ...
        beta1*(Pob(f(i2,2),i1)-Pob(f(i2,1),i1));
    aux2 = Pob(f(i2,2),i1) - ...
        beta2*(Pob(f(i2,2),i1)-Pob(f(i2,1),i1));
    Pob_C(idx,i1) = aux1;
    Pob_C(idx+1,i1) = aux2;
    idx = idx+2;
 end
 end
 end