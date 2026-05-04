function compound_properties()
    % Define atomic masses (in g/mol)
    atomic_masses = containers.Map({'H', 'C', 'N', 'O', 'S', 'Cl', 'Br', 'I', ...
                                     'Na', 'K', 'Ca', 'Mg', 'Al', 'Fe', 'Cu', ...
                                     'Ag', 'Zn', 'Au', 'Hg', 'Pb'}, ...
                                    [1.008, 12.011, 14.007, 15.999, 32.06, ...
                                     35.45, 79.904, 126.904, 22.99, 39.098, ...
                                     40.078, 24.305, 26.982, 55.845, 63.546, ...
                                     107.8682, 65.38, 196.966569, 200.592, ...
                                     207.2]);

    % Input the compound formula
    formula = input('Enter the compound formula (e.g., C6H12O6): ', 's');
    
    % Calculate molar mass
    molar_mass = calculate_molar_mass(formula, atomic_masses);
    
    % Display molar mass
    if ~isnan(molar_mass)
        fprintf('Molar Mass: %.2f g/mol\n', molar_mass);
        % Predict solubility
        solubility = predict_solubility(formula);
        fprintf('Predicted Solubility: %s\n', solubility);
    else
        fprintf('Error: Invalid formula entered.\n');
    end
end

function molar_mass = calculate_molar_mass(formula, atomic_masses)
    % Initialize variables
    molar_mass = 0;
    element_pattern = '([A-Z][a-z]*)(\d*)'; % Regex pattern for elements and their counts
    tokens = regexp(formula, element_pattern, 'tokens'); % Extract elements

    % Calculate the molar mass
    for i = 1:length(tokens)
        element = tokens{i}{1}; % Element symbol
        count = str2double(tokens{i}{2}); % Count of the element
        if isempty(count)
            count = 1; % Default count is 1 if not specified
        end
        if isKey(atomic_masses, element)
            molar_mass = molar_mass + atomic_masses(element) * count;
        else
            molar_mass = NaN; % Invalid element
            return;
        end
    end
end

function solubility = predict_solubility(formula)
    % Basic rules for predicting solubility
    % This can be expanded with more complex rules if needed.
    if contains(formula, 'Na') || contains(formula, 'K') || contains(formula, 'NH4') || ...
       contains(formula, 'Cl') || contains(formula, 'NO3') || contains(formula, 'CH3COO')
        solubility = 'Soluble in water'; % Common soluble compounds
    elseif contains(formula, 'Ag') || contains(formula, 'Pb') || contains(formula, 'Hg')
        solubility = 'Insoluble in water'; % Common insoluble compounds
    else
        solubility = 'Solubility not determined'; % Default for unknown compounds
    end
end
