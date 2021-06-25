function robi=rotador(robi,art,ang)
artic=fieldnames(robi);
i=1;
if strcmp(art,'base')==1
    i=0;
    eje=[0 0 1];
    centro=[0 0 0];
else
    while strcmp(artic{i},art)==0
        i=i+1;
        if i>=size(artic,1)
        break
        end
    end
    eje=robi.(artic{i}).eje;
    centro=robi.(artic{i}).centro;
end
for j=i+1:size(artic,1)
    cachitos=robi.(artic{j}).h;
    for k=1:size(cachitos,2)
        rotate(cachitos(k),eje,ang,centro);
        if (isfield(robi.(artic{j}),'eje'))
            %calculamos el vector desde origen
            vdeo=robi.(artic{j}).eje+robi.(artic{j}).centro;
            vdeo=rotadorr(vdeo,eje,centro,ang);
           ctr=rotadorr(robi.(artic{j}).centro,eje,centro,ang);
            robi.(artic{j}).eje=vdeo-ctr;
        end
          robi.(artic{j}).centro=rotadorr(robi.(artic{j}).centro,eje,centro,ang);
    end
end