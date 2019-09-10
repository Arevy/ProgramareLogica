b(daniel).
b(darius).
b(alin).
b(ionel).
b(alex).
b(train).


f(alina).
f(diana).
f(raluca).
f(andreea).
f(daniela).
f(rebeca).

frati(alina, daniel).
frati(daniel, alina).

frati(diana, darius).
frati(darius, raluca).

frati(raluca, alin).
frati(alin, diana).

frati(andreea, ionel).
frati(ionel, andreea).

frati(daniela, alex).
frati(alex, daniela).

frati(rebeca, traian).
frati(traian, rebeca).

veri(alina, darius).
veri(darius, alina).
veri(diana, alin).
veri(alin, diana).
veri(daniela, traian).
veri(traian, daniela).

frati2(X,Y) :- frati(X,Z), frati(Z,Y).


