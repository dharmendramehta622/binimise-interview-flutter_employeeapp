fvm flutter clean
fvm flutter pub get
echo 'Pub get successfully executed in mesaure_app App.'
cd packages/global && fvm flutter pub get
echo 'Pub get successfully executed in global package.'
cd .. && cd staff && fvm flutter pub get
echo 'Pub get successfully executed in staff package.'
# TODO - ENDOF PUB GET
