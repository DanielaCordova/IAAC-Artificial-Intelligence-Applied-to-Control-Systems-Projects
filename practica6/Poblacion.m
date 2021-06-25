function [P] = Poblacion(N,L,V)
%N = Numero de individuos
%L = Longitud del cromosoma
%V = Numero de variables
    P = round(rand(N,L*V));
end