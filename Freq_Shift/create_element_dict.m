function element_dict = create_element_dict()
element_dict = containers.Map(...
{'hydrogen', 'oxygen', 'sodium', 'chloride', 'carbon', 'nitrogen', 'potassium', ...
'sulfur', 'phosphorus', 'calcium', 'magnesium', 'iron', 'copper', 'zinc', 'aluminum', ...
'water', 'carbon dioxide', 'methane', 'sulfuric acid', 'ammonia', 'glucose'}, ...
{'H', 'O', 'Na', 'Cl', 'C', 'N', 'K', 'S', 'P', 'Ca', 'Mg', 'Fe', 'Cu', 'Zn', 'Al', ...
'H2O', 'CO2', 'CH4', 'H2SO4', 'NH3', 'C6H12O6'});
end
% Function to construct the formula from the compound name
function formula = compound_to_formula(compound_name)
% Get the element dictionary
element_dict = create_element_dict();
% Convert the name to lowercase and trim spaces
compound_name = lower(strtrim(compound_name));
% Check if the whole compound name matches a known compound
if isKey(element_dict, compound_name)
formula = element_dict(compound_name);
else
% Split the name into words (for binary compounds)
elements = strsplit(compound_name);
formula_parts = {}; % Initialize as a cell array
% Iterate through the elements and build the formula
for i = 1:length(elements)
element = elements{i};
if isKey(element_dict, element)
formula_parts{end + 1} = element_dict(element); % Append to the cell array
else
formula = sprintf('Element or compound "%s" not found in the dictionary.', element);
return;
end
end
% Concatenate the symbols to form the formula
formula = strjoin(formula_parts, '');
end
end
% Main script to test various compounds or input from the user
while true
% Ask the user for a compound name
compound = input('Enter the name of the compound (or type "exit" to quit): ', 's');
if strcmpi(compound, 'exit')
break; % Exit the loop if the user types 'exit'
end
% Get the formula for the input compound
formula = compound_to_formula(compound);
fprintf('The formula for %s is: %s\n', compound, formula);
end