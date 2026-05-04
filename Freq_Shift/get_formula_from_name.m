function formula = get_formula_from_name(compound_name)
    % Create a map of compound names to their chemical formulas
    compound_map = containers.Map(...
        {'Water', 'Sodium Chloride', 'Glucose', 'Sulfuric Acid', 'Ammonia', 'Ethanol', 'Carbon Dioxide'}, ...
        {'H2O', 'NaCl', 'C6H12O6', 'H2SO4', 'NH3', 'C2H5OH', 'CO2'});
    
    % Convert the input to the correct case for matching
    compound_name_lower = compound_name;
    
    % Get the keys from the map
    keys_list = keys(compound_map);  % Get the keys (compound names)
    
    % Initialize a variable to store the index
    index = [];

    % Loop through the keys to find a match
    for i = 1:length(keys_list)
        if strcmpi(keys_list{i}, compound_name_lower)
            index = i;  % Store the index of the matching compound
            break;  % Exit the loop if a match is found
        end
    end
    
    % If the compound is found, return the formula
    if ~isempty(index)
        formula = compound_map(keys_list{index});
    else
        formula = 'Compound not found. Please check the name.';
    end
end