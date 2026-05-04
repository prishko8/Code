function unitConverter
    disp('Unit Conversion Menu:');
    disp('1. Energy: Joules to Calories to Electron-volts');
    disp('2. Temperature: Kelvins to Celsius to Fahrenheit');
    disp('3. Volume: Cubic Meters to Liters');
    disp('4. Length: Meters to Angstroms, Inches, Feet, Yards, Miles');
    disp('5. Mass: Kilograms to Pounds');
    disp('6. Pressure: Pascals to Atmospheres, Bars, mm Hg');
    disp('7. Time: Seconds to Minutes, Hours, Days');
    
    choice = input('Select conversion type (1-7): ');
    
    switch choice
        case 1
            energyConversion();
        case 2
            temperatureConversion();
        case 3
            volumeConversion();
        case 4
            lengthConversion();
        case 5
            massConversion();
        case 6
            pressureConversion();
        case 7
            timeConversion();
        otherwise
            disp('Invalid choice. Please select a number between 1 and 7.');
    end
end

function energyConversion()
 disp('energy Conversion Menu:');
    disp('1. Energy: Joules');
    disp('2. Energy: Calories');
    disp('3. Energy; electron volts');
    choice = input('Select conversion type (1-3): ');
    
    switch choice
        case 1
            joulesConversion();
        case 2
            caloriesConversion();
        case 3
            electronvoltsConversion();
    otherwise
            disp('Invalid choice. Please select a number between 1 and 3.');
end

    function joulesConversion()
    joules = input('Enter energy in Joules: ');
    calories = joules * 0.239006; % 1 Joule = 0.239006 calories
    electron_volts = joules / 1.60218e-19; % 1 Joule = 6.242e18 eV
    fprintf('Energy in calories: %.4f\n', calories);
    fprintf('Energy in Electron-volts: %.4f\n', electron_volts);
end

function caloriesConversion()
  calories = input('Enter energy in calories: ');
    joules = calories * 4.184; % 1 calorie = 4.184 joules
    electron_volts = calories * 2.6114e+19; % 1 calorie = 2.611e+22 eV
    fprintf('Energy in Joules: %.4f\n', joules);
    fprintf('Energy in Electron-volts: %.4f\n', electron_volts);
end

    function electronvoltsConversion ()
   electron_volts = input('Enter energy in electron-volts: ');
    calories = electron_volts * 3.82929e-23; % 1 calorie = 2.611e+19 eV
    joules = electron_volts * 1.60218e-19; % 1 Joule = 6.242e18 eV
    fprintf('Energy in calories: %.4f\n', calories);
    fprintf('Energy in Joules: %.4f\n', joules);
 end
end

 function temperatureConversion() 
    disp('Temperature Conversion Menu:');
    disp('1. Temperature: Kelvin');
    disp('2. Temperature: Celsius');
    disp('3. Temperature; Fahrenheit');
    choice = input('Select conversion type (1-3): ');

    switch choice
        case 1
            kelvinConversion();
        case 2
            celsiusConversion();
        case 3
            farenheitConversion();
    otherwise
            disp('Invalid choice. Please select a number between 1 and 3.');
end

    function kelvinConversion ()
    kelvin = input('Enter temperature in Kelvin: ');
    celsius = kelvin - 273.15; % K to C
    fahrenheit = celsius * 9/5 + 32; % C to F
    fprintf('Temperature in Celsius: %.2f\n', celsius);
    fprintf('Temperature in Fahrenheit: %.2f\n', fahrenheit);
    end

function celsiusConversion ()
    celsius = input('Enter temperature in Celsius: ');
    kelvin = celsius + 273.15; % K to C
    fahrenheit = celsius * 9/5 + 32; % F to C
    fprintf('Temperature in kelvin: %.2f\n', kelvin);
    fprintf('Temperature in Fahrenheit: %.2f\n', fahrenheit);
end

        function farenheitConversion ()
    farenheit = input('Enter temperature in Farenheit: ');
    celsius = (farenheit - 32) * 5/9; % F to C
    kelvin = celsius + 273.15 % F to C
    fprintf('Temperature in Celsius: %.2f\n', celsius);
    fprintf('Temperature in kelvin: %.2f\n', kelvin);
 end
end

function volumeConversion()
 disp('energy Conversion Menu:');
    disp('1. Volume: Cubic meters');
    disp('2. Volume: Litres');
    choice = input('Select conversion type (1-2): ');
    
    switch choice
        case 1
            cubic_metersConversion();
        case 2
            litersConversion();
    otherwise
            disp('Invalid choice. Please select a number between 1 and 2.');
end
    function cubic_metersConversion ()
    cubic_meters = input('Enter volume in Cubic Meters: ');
    liters = cubic_meters * 0.001; % 1 m^3 = 1000 L
    fprintf('Volume in Liters: %.2f\n', liters);
end
    function litersConversion
    liters = input('Enter volume in Liters: ');
    cubic_meters = liters * 1000; % 1 m^3 = 1000 L
    fprintf('Volume in cubic meters: %.2f\n', cubic_meters);
end
end

function lengthConversion()
  disp('legnth Conversion Menu:');
    disp('1. legnth: meters');
    disp('2. legnth: angstroms');
    disp('3. legnth: inches');
    disp('4. legnth:feet')
    disp('5. legnth: yards')
    disp ('6. lehnth: miles')
    choice = input('Select conversion type (1-6): ');

     switch choice
        case 1
            metersConversion();
        case 2
            angstromsConversion();
        case 3
            inchesConversion();
         case 4
             feetConversion()
         case 5
             yardsConversion ()
         case 6
             milesConversion ()
    
    otherwise
            disp('Invalid choice. Please select a number between 1 and 7.');
    end



    function metersConversion ()
    meters = input('Enter length in Meters: ');
    angstroms = meters * 1e10; % 1 m = 1e10 Å
    inches = meters * 39.3701; % 1 m = 39.3701 inches
    feet = meters * 3.28084; % 1 m = 3.28084 feet
    yards = meters * 1.09361; % 1 m = 1.09361 yards
    miles = meters * 0.000621371; % 1 m = 0.000621371 miles
    fprintf('Length in Angstroms: %.2f\n', angstroms);
    fprintf('Length in Inches: %.2f\n', inches);
    fprintf('Length in Feet: %.2f\n', feet);
    fprintf('Length in Yards: %.2f\n', yards);
    fprintf('Length in Miles: %.2f\n', miles);
    end

    function angstromsConversion ()
    angstroms = input('Enter length in angstroms: ');
    meters = angstroms / 1e10; % 1 m = 1e10 Å
    inches = meters * 39.3701; % 1 m = 39.3701 inches
    feet = meters * 3.28084; % 1 m = 3.28084 feet
    yards = meters * 1.09361; % 1 m = 1.09361 yards
    miles = meters * 0.000621371; % 1 m = 0.000621371 miles
    fprintf('Length in meters: %.2f\n', meters);
    fprintf('Length in Inches: %.2f\n', inches);
    fprintf('Length in Feet: %.2f\n', feet);
    fprintf('Length in Yards: %.2f\n', yards);
    fprintf('Length in Miles: %.2f\n', miles);
    end

    function inchesConversion ()
    inches = input('Enter length in inches: ');
    angstroms = (inches / 39.3701) * 1e10; % 1 m = 1e10 Å
    meters = inches / 39.3701; % 1 m = 39.3701 inches
    feet = meters * 3.28084; % 1 m = 3.28084 feet
    yards = meters * 1.09361; % 1 m = 1.09361 yards
    miles = meters * 0.000621371; % 1 m = 0.000621371 miles
    fprintf('Length in Angstroms: %.2f\n', angstroms);
    fprintf('Length in meters: %.2f\n', meters);
    fprintf('Length in Feet: %.2f\n', feet);
    fprintf('Length in Yards: %.2f\n', yards);
    fprintf('Length in Miles: %.2f\n', miles);
    end

function feetConversion ()
    feet = input('Enter length in feet: ');
    angstroms = (feet / 3.28084) * 1e10; % 1 m = 1e10 Å
    inches = (feet / 3.28084) * 39.3701; % 1 m = 39.3701 inches
    meters = feet / 3.28084; % 1 m = 3.28084 feet
    yards = meters * 1.09361; % 1 m = 1.09361 yards
    miles = meters * 0.000621371; % 1 m = 0.000621371 miles
    fprintf('Length in Angstroms: %.2f\n', angstroms);
    fprintf('Length in Inches: %.2f\n', inches);
    fprintf('Length in meters: %.2f\n', meters);
    fprintf('Length in Yards: %.2f\n', yards);
    fprintf('Length in Miles: %.2f\n', miles);
end

function yardsConversion ()
    yards = input('Enter length in yards: ');
    angstroms = (yards / 1.09361) * 1e10; % 1 m = 1e10 Å
    inches = (yards / 1.09361) * 39.3701; % 1 m = 39.3701 inches
    feet = (yards / 1.09361) * 3.28084; % 1 m = 3.28084 feet
    meters = yards / 1.09361; % 1 m = 1.09361 yards
    miles = meters * 0.000621371; % 1 m = 0.000621371 miles
    fprintf('Length in Angstroms: %.2f\n', angstroms);
    fprintf('Length in Inches: %.2f\n', inches);
    fprintf('Length in Feet: %.2f\n', feet);
    fprintf('Length in meters: %.2f\n', meters);
    fprintf('Length in Miles: %.2f\n', miles);
end

function milesConversion ()
    miles = input('Enter length in miles: ');
    angstroms = (miles / 0.000621371) * 1e10; % 1 m = 1e10 Å
    inches = (miles / 0.000621371) * 39.3701; % 1 m = 39.3701 inches
    feet = (miles / 0.000621371) * 3.28084; % 1 m = 3.28084 feet
    yards = (miles / 0.000621371) * 1.09361; % 1 m = 1.09361 yards
    meters = miles / 0.000621371; % 1 m = 0.000621371 miles
    fprintf('Length in Angstroms: %.2f\n', angstroms);
    fprintf('Length in Inches: %.2f\n', inches);
    fprintf('Length in Feet: %.2f\n', feet);
    fprintf('Length in Yards: %.2f\n', yards);
    fprintf('Length in meters: %.2f\n', meters);
end
end

function massConversion()
disp('mass Conversion Menu:');
    disp('1. mass: Kg');
    disp('2. mass: pounds')
    choice = input('Select conversion type (1-2): ');
    
    switch choice
        case 1
            kgConversion();
        case 2
            poundsConversion();
    otherwise
            disp('Invalid choice. Please select a number between 1 and 2.');
end
    function kgConversion ()
    kg = input('Enter mass in Kilograms: ');
    pounds = kg * 2.20462; % 1 kg = 2.20462 lbs
    fprintf('Mass in Pounds: %.2f\n', pounds);
    end
    function poundsConversion ()
    pounds = input('Enter mass in pounds: ');
    kg = pounds / 2.20462; % 1 kg = 2.20462 lbs
    fprintf('Mass in kilograms: %.2f\n', kg);
end
end

function pressureConversion()
disp('energy Conversion Menu:');
    disp('1. pressure: pascals');
    disp('2. pressure: atmosheres');
    disp('3. pressure: bars');
    disp ('4. pressure mmHg')
    choice = input('Select conversion type (1-4): ');
    
    switch choice
        case 1
            pascalsConversion();
        case 2
            atmospheresConversion();
        case 3
            barsConversion();
        case 4
            mmhgConversion ();
    otherwise
            disp('Invalid choice. Please select a number between 1 and 4.');
    end

    function pascalsConversion ()
    pascals = input('Enter pressure in Pascals: ');
    atmospheres = pascals / 101325; % 1 atm = 101325 Pa
    bars = pascals / 100000; % 1 bar = 100000 Pa
    mmHg = pascals * 0.00750062; % 1 Pa = 0.00750062 mmHg
    fprintf('Pressure in Atmospheres: %.4f\n', atmospheres);
    fprintf('Pressure in Bars: %.4f\n', bars);
    fprintf('Pressure in mm Hg: %.4f\n', mmHg);
    end

function atmospheresConversion ()
    atm = input('Enter pressure in atmospheres: ');
    pascals = atm * 101325; % 1 atm = 101325 Pa
    bars = pascals / 100000; % 1 bar = 100000 Pa
    mmHg = pascals * 0.00750062; % 1 Pa = 0.00750062 mmHg
    fprintf('Pressure in Pascals: %.4f\n', pascals);
    fprintf('Pressure in Bars: %.4f\n', bars);
    fprintf('Pressure in mm Hg: %.4f\n', mmHg);
end

function barsConversion ()
    bars = input('Enter pressure in bars: ');
    atmospheres = (bars / 100000) / 101325; % 1 atm = 101325 Pa
    pascals = bars / 100000; % 1 bar = 100000 Pa
    mmHg = pascals * 0.00750062; % 1 Pa = 0.00750062 mmHg
    fprintf('Pressure in Atmospheres: %.4f\n', atmospheres);
    fprintf('Pressure in pascals: %.4f\n', pascals);
    fprintf('Pressure in mm Hg: %.4f\n', mmHg);
end

function mmhgConversion ()
    mmHg = input('Enter pressure in mmHg: ');
    atmospheres = (mmHg * 0.00750062) / 101325; % 1 atm = 101325 Pa
    bars = (mmHg * 0.00750062) / 100000; % 1 bar = 100000 Pa
    pascals = mmHg * 0.00750062; % 1 Pa = 0.00750062 mmHg
    fprintf('Pressure in Atmospheres: %.4f\n', atmospheres);
    fprintf('Pressure in Bars: %.4f\n', bars);
    fprintf('Pressure in Pascals: %.4f\n', pascals);
    end
end

function timeConversion()
    disp('1. Time: seconds');
    disp('2. Time: minutes');
    disp('3. Time: hours');
    disp('4. time: days')
    choice = input('Select conversion type (1-4): ');
    
    switch choice
        case 1
            secondsConversion();
        case 2
            minutesConversion();
        case 3
            hoursConversion();
        case 4
            daysConversion ()
    otherwise
            disp('Invalid choice. Please select a number between 1 and 4.');
end


    function secondsConversion()
    seconds = input('Enter time in Seconds: ');
    minutes = seconds / 60; % 1 minute = 60 seconds
    hours = seconds / 3600; % 1 hour = 3600 seconds
    days = seconds / 86400; % 1 day = 86400 seconds
    fprintf('Time in Minutes: %.2f\n', minutes);
    fprintf('Time in Hours: %.2f\n', hours);
    fprintf('Time in Days: %.2f\n', days);
end


    function minutesConversion()
    minutes = input('Enter time in minutes: ');
    seconds = minutes * 60; % 1 minute = 60 seconds
    hours = seconds / 3600; % 1 hour = 3600 seconds
    days = seconds / 86400; % 1 day = 86400 seconds
    fprintf('Time in Seconds: %.2f\n', seconds);
    fprintf('Time in Hours: %.2f\n', hours);
    fprintf('Time in Days: %.2f\n', days);
end

    function hoursConversion()
    hours = input('Enter time in hours: ');
    seconds = hours * 3600; 
    minutes = seconds / 60; % 1 hour = 3600 seconds
    days = seconds / 86400; % 1 day = 86400 seconds
    fprintf('Time in Seconds: %.2f\n', seconds);
    fprintf('Time in minutes: %.2f\n', minutes);
    fprintf('Time in Days: %.2f\n', days);
    end

function daysConversion()
    days= input('Enter time in days: ');
    seconds = days * 86400; 
    minutes = seconds / 60; % 1 hour = 3600 seconds
    hours = days / 24; % 1 day = 86400 seconds
    fprintf('Time in Seconds: %.2f\n', seconds);
    fprintf('Time in minutes: %.2f\n', minutes);
    fprintf('Time in hours: %.2f\n', hours);
end
end





