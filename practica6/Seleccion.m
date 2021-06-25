function [ PobSel ] = Seleccion(Pob_2,ff)
    %Obtener tamano de la poblacion
    [R C]= size(Pob_2);
    %Ordenar de menor a mayor
    [B,idx]= sort(ff);
    Pob_2 = Pob_2(idx,:);
    %Seleccionar la mitad de
    %la mejor poblaciˆUn
    PobSel = Pob_2(1:R/2,:);
 end
