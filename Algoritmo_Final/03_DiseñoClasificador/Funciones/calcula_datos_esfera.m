% Devuelve CENTROIDE_R CENTROIDE G_ CENTROIDE_B, RADIO1, RADIO2, RADIO12
% RADIO1: engloba TODOS los valores del color de objeto
function datosEsfera = calcula_datos_esfera(X,Y)
datosEsfera = [];

%% 1 Calcular el centroide de la nube de puntos del color de seguimiento
XObjeto = X(Y==1, :);
XFondo = X(Y==0, :);

numDatosObjeto = size(XObjeto,1);
numDatosFondo = size(XFondo, 1);

% Centro de la esfera: color medio
valoresMedios = mean(XObjeto);
Rc = valoresMedios(1); Gc = valoresMedios(2); Bc = valoresMedios(3);
% Lo asignamos a la variable de retorno
datosEsfera = [Rc Gc Bc];

%% 2 Calcular Radio1 que englobe todos los puntos del color de seguimiento
% Calculamos todas las Distancias eucl�deas del centroide a los puntos del
% objeto de seguimiento y nos qudamos con la mayor

centroideT = valoresMedios';

% FORMA 1: CON BUCLE FOR DATO A DATO
% Inicializamos la distancia al primero
% distanciaMax = sqrt(sum( XObjeto(1,:)' - centroideT ).^2);
% 
% for i=1:numDatosObjeto
%     datoT = XObjeto(i,:)';
%     distancia = (sqrt(sum(datoT - centroideT).^2));
%     
%     if  distancia > distanciaMax
%         distanciaMax = distancia;
%     end   
% end
% 
% r1 = distanciaMax;
% datosEsfera = [datosEsfera r1];

% FORMA 2:

datosT = XObjeto';
% Repite el centroide para poder hacer la resta uno a uno
centroideAmp = repmat(centroideT, 1, size(datosT,2)); 

vectorDistancia = sqrt(sum( datosT - centroideAmp ).^2);

distanciaMax = max(vectorDistancia);
r1 = distanciaMax;
datosEsfera = [datosEsfera r1];



end

