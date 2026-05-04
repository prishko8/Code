function elementInfo()
    % Define the properties of all elements
    elements = {
        'Hydrogen', 'Nonmetal', 'H', 1.008, 0.00008988, 'Gas';
        'Helium', 'Nonmetal', 'He', 4.0026, 0.0001786, 'Gas';
        'Lithium', 'Metal', 'Li', 6.94, 0.534, 'Solid';
        'Beryllium', 'Metal', 'Be', 9.0122, 1.85, 'Solid';
        'Boron', 'Metalloid', 'B', 10.81, 2.34, 'Solid';
        'Carbon', 'Nonmetal', 'C', 12.011, 2.267, 'Solid';
        'Nitrogen', 'Nonmetal', 'N', 14.007, 0.0012506, 'Gas';
        'Oxygen', 'Nonmetal', 'O', 15.999, 0.001429, 'Gas';
        'Fluorine', 'Nonmetal', 'F', 18.998, 0.001696, 'Gas';
        'Neon', 'Nonmetal', 'Ne', 20.180, 0.0008999, 'Gas';
        'Sodium', 'Metal', 'Na', 22.990, 0.971, 'Solid';
        'Magnesium', 'Metal', 'Mg', 24.305, 1.738, 'Solid';
        'Aluminum', 'Metal', 'Al', 26.982, 2.70, 'Solid';
        'Silicon', 'Metalloid', 'Si', 28.085, 2.33, 'Solid';
        'Phosphorus', 'Nonmetal', 'P', 30.974, 1.82, 'Solid';
        'Sulfur', 'Nonmetal', 'S', 32.06, 2.067, 'Solid';
        'Chlorine', 'Nonmetal', 'Cl', 35.45, 0.003214, 'Gas';
        'Argon', 'Nonmetal', 'Ar', 39.948, 0.001784, 'Gas';
        'Potassium', 'Metal', 'K', 39.098, 0.862, 'Solid';
        'Calcium', 'Metal', 'Ca', 40.078, 1.54, 'Solid';
        'Scandium', 'Metal', 'Sc', 44.956, 2.985, 'Solid';
        'Titanium', 'Metal', 'Ti', 47.867, 4.506, 'Solid';
        'Vanadium', 'Metal', 'V', 50.942, 6.11, 'Solid';
        'Chromium', 'Metal', 'Cr', 51.996, 7.15, 'Solid';
        'Manganese', 'Metal', 'Mn', 54.938, 7.44, 'Solid';
        'Iron', 'Metal', 'Fe', 55.845, 7.874, 'Solid';
        'Cobalt', 'Metal', 'Co', 58.933, 8.90, 'Solid';
        'Nickel', 'Metal', 'Ni', 58.693, 8.912, 'Solid';
        'Copper', 'Metal', 'Cu', 63.546, 8.96, 'Solid';
        'Zinc', 'Metal', 'Zn', 65.38, 7.14, 'Solid';
        'Gallium', 'Metal', 'Ga', 69.723, 5.91, 'Solid';
        'Germanium', 'Metalloid', 'Ge', 72.63, 5.323, 'Solid';
        'Arsenic', 'Metalloid', 'As', 74.922, 5.776, 'Solid';
        'Selenium', 'Nonmetal', 'Se', 78.971, 4.809, 'Solid';
        'Bromine', 'Nonmetal', 'Br', 79.904, 0.00312, 'Liquid';
        'Krypton', 'Nonmetal', 'Kr', 83.798, 0.003733, 'Gas';
        'Rubidium', 'Metal', 'Rb', 85.468, 1.532, 'Solid';
        'Strontium', 'Metal', 'Sr', 87.62, 2.64, 'Solid';
        'Yttrium', 'Metal', 'Y', 88.906, 4.469, 'Solid';
        'Zirconium', 'Metal', 'Zr', 91.224, 6.506, 'Solid';
        'Niobium', 'Metal', 'Nb', 92.906, 8.57, 'Solid';
        'Molybdenum', 'Metal', 'Mo', 95.95, 10.28, 'Solid';
        'Technetium', 'Metal', 'Tc', 98, 11.5, 'Solid';
        'Ruthenium', 'Metal', 'Ru', 101.07, 12.37, 'Solid';
        'Rhodium', 'Metal', 'Rh', 102.91, 12.41, 'Solid';
        'Palladium', 'Metal', 'Pd', 106.42, 12.02, 'Solid';
        'Silver', 'Metal', 'Ag', 107.87, 10.49, 'Solid';
        'Cadmium', 'Metal', 'Cd', 112.41, 8.65, 'Solid';
        'Indium', 'Metal', 'In', 114.82, 7.31, 'Solid';
        'Tin', 'Metal', 'Sn', 118.71, 7.31, 'Solid';
        'Antimony', 'Metalloid', 'Sb', 121.76, 6.697, 'Solid';
        'Tellurium', 'Metalloid', 'Te', 127.60, 6.24, 'Solid';
        'Iodine', 'Nonmetal', 'I', 126.90, 4.933, 'Solid';
        'Xenon', 'Nonmetal', 'Xe', 131.29, 0.005887, 'Gas';
        'Cesium', 'Metal', 'Cs', 132.91, 1.873, 'Solid';
        'Barium', 'Metal', 'Ba', 137.33, 3.62, 'Solid';
        'Lanthanum', 'Metal', 'La', 138.91, 6.165, 'Solid';
        'Cerium', 'Metal', 'Ce', 140.12, 6.770, 'Solid';
        'Praseodymium', 'Metal', 'Pr', 140.91, 6.773, 'Solid';
        'Neodymium', 'Metal', 'Nd', 144.24, 7.007, 'Solid';
        'Promethium', 'Metal', 'Pm', 145, 7.26, 'Solid';
        'Samarium', 'Metal', 'Sm', 150.36, 7.52, 'Solid';
        'Europium', 'Metal', 'Eu', 151.96, 5.244, 'Solid';
        'Gadolinium', 'Metal', 'Gd', 157.25, 7.895, 'Solid';
        'Terbium', 'Metal', 'Tb', 158.93, 8.230, 'Solid';
        'Dysprosium', 'Metal', 'Dy', 162.50, 8.55, 'Solid';
        'Holmium', 'Metal', 'Ho', 164.93, 8.79, 'Solid';
        'Erbium', 'Metal', 'Er', 167.26, 9.07, 'Solid';
        'Thulium', 'Metal', 'Tm', 168.93, 9.32, 'Solid';
        'Ytterbium', 'Metal', 'Yb', 173.04, 6.965, 'Solid';
        'Lutetium', 'Metal', 'Lu', 174.97, 9.84, 'Solid';
        'Hafnium', 'Metal', 'Hf', 178.49, 13.31, 'Solid';
        'Tantalum', 'Metal', 'Ta', 180.95, 16.65, 'Solid';
        'Tungsten', 'Metal', 'W', 183.84, 19.25, 'Solid';
        'Rhenium', 'Metal', 'Re', 186.21, 21.02, 'Solid';
        'Osmium', 'Metal', 'Os', 190.23, 22.59, 'Solid';
        'Iridium', 'Metal', 'Ir', 192.22, 22.56, 'Solid';
        'Platinum', 'Metal', 'Pt', 195.08, 21.45, 'Solid';
        'Gold', 'Metal', 'Au', 196.97, 19.32, 'Solid';
        'Mercury', 'Metal', 'Hg', 200.59, 13.534, 'Liquid';
        'Thallium', 'Metal', 'Tl', 204.38, 11.85, 'Solid';
        'Lead', 'Metal', 'Pb', 207.2, 11.343, 'Solid';
        'Bismuth', 'Metal', 'Bi', 208.98, 9.78, 'Solid';
        'Polonium', 'Metal', 'Po', 209, 9.2, 'Solid';
        'Astatine', 'Nonmetal', 'At', 210, 0.000007, 'Solid';
        'Radon', 'Nonmetal', 'Rn', 222, 0.0000000055, 'Gas';
        'Francium', 'Metal', 'Fr', 223, 1.87, 'Solid';
        'Radium', 'Metal', 'Ra', 226, 5.5, 'Solid';
        'Actinium', 'Metal', 'Ac', 227, 10.07, 'Solid';
        'Thorium', 'Metal', 'Th', 232.04, 11.72, 'Solid';
        'Protactinium', 'Metal', 'Pa', 231.04, 15.37, 'Solid';
        'Uranium', 'Metal', 'U', 238.03, 18.95, 'Solid';
        'Neptunium', 'Metal', 'Np', 237, 20.25, 'Solid';
        'Plutonium', 'Metal', 'Pu', 244, 19.86, 'Solid';
        'Americium', 'Metal', 'Am', 243, 13.67, 'Solid';
        'Curium', 'Metal', 'Cm', 247, 13.51, 'Solid';
        'Berkelium', 'Metal', 'Bk', 247, 14.78, 'Solid';
        'Californium', 'Metal', 'Cf', 251, 15.1, 'Solid';
        'Einsteinium', 'Metal', 'Es', 252, 8.8, 'Solid';
        'Fermium', 'Metal', 'Fm', 257, 9.7, 'Solid';
        'Mendelevium', 'Metal', 'Md', 258, 10.3, 'Solid';
        'Nobelium', 'Metal', 'No', 259, 9.8, 'Solid';
        'Lawrencium', 'Metal', 'Lr', 262, 13.5, 'Solid';
        'Rutherfordium', 'Metal', 'Rf', 267, 17.4, 'Solid';
        'Dubnium', 'Metal', 'Db', 268, 15.7, 'Solid';
        'Seaborgium', 'Metal', 'Sg', 271, 14.5, 'Solid';
        'Bohrium', 'Metal', 'Bh', 270, 17.0, 'Solid';
        'Hassium', 'Metal', 'Hs', 277, 16.6, 'Solid';
        'Meitnerium', 'Metal', 'Mt', 278, 16.0, 'Solid';
        'Darmstadtium', 'Metal', 'Ds', 281, 18.2, 'Solid';
        'Roentgenium', 'Metal', 'Rg', 282, 16.9, 'Solid';
        'Copernicium', 'Metal', 'Cn', 285, 15.2, 'Solid';
        'Nihonium', 'Metal', 'Nh', 286, 16.6, 'Solid';
        'Flerovium', 'Metal', 'Fl', 289, 14.0, 'Solid';
        'Moscovium', 'Metal', 'Mc', 290, 13.0, 'Solid';
        'Livermorium', 'Metal', 'Lv', 293, 12.0, 'Solid';
        'Tennessine', 'Nonmetal', 'Ts', 294, 7.2, 'Solid';
        'Oganesson', 'Nonmetal', 'Og', 294, 3.4, 'Gas'
    };

    % Prompt user for atomic number
    atomicNumber = input('Enter the atomic number of the element (1-118): ');

    % Check if the input is valid
    if atomicNumber < 1 || atomicNumber > 118
        disp('Invalid atomic number. Please enter a number between 1 and 118.');
        return;
    end

    % Retrieve element information
    element = elements(atomicNumber, :);
    elementName = element{1};
    elementType = element{2};
    elementSymbol = element{3};
    molarMass = element{4};
    density = element{5};
    phase = element{6};

    % Display the element information
    fprintf('Element: %s\n', elementName);
    fprintf('Type: %s\n', elementType);
    fprintf('Symbol: %s\n', elementSymbol);
    fprintf('Molar Mass: %.2f g/mol\n', molarMass);
    fprintf('Density: %.6f g/cm^3\n', density);
    fprintf('Phase at STP: %s\n', phase);
end
