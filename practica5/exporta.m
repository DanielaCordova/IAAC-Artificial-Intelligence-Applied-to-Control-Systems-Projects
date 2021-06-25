function exporta
suck=get(gcf,'UserData');
datos=suck{3};
assignin('base','datos',datos);
helpdlg('los datos acumulados se han guardado en la estructura ''datos''','Datos exportados al workspace')