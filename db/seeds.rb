# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


##########################
# SEED bart_travel_times #
##########################

## from embarcadero ('rich'(red), 'dubl'(blue) lines)
BartTravelTime.create(start: 'embr', end: 'woak', time_in_min: 7, final_stop: 'rich')
BartTravelTime.create(start: 'embr', end: '12th', time_in_min: 11, final_stop: 'rich')
BartTravelTime.create(start: 'embr', end: '19th', time_in_min: 12, final_stop: 'rich')
BartTravelTime.create(start: 'embr', end: 'mcar', time_in_min: 16, final_stop: 'rich')

BartTravelTime.create(start: 'embr', end: 'ashb', time_in_min: 19, final_stop: 'rich')
BartTravelTime.create(start: 'embr', end: 'dbrk', time_in_min: 21, final_stop: 'rich')
BartTravelTime.create(start: 'embr', end: 'nbrk', time_in_min: 24, final_stop: 'rich')
BartTravelTime.create(start: 'embr', end: 'plza', time_in_min: 27, final_stop: 'rich')
BartTravelTime.create(start: 'embr', end: 'deln', time_in_min: 30, final_stop: 'rich')
BartTravelTime.create(start: 'embr', end: 'rich', time_in_min: 34, final_stop: 'rich')

BartTravelTime.create(start: 'embr', end: 'lake', time_in_min: 12, final_stop: 'dubl')
BartTravelTime.create(start: 'embr', end: 'ftvl', time_in_min: 16, final_stop: 'dubl')
BartTravelTime.create(start: 'embr', end: 'cols', time_in_min: 19, final_stop: 'dubl')
BartTravelTime.create(start: 'embr', end: 'sanl', time_in_min: 23, final_stop: 'dubl')
BartTravelTime.create(start: 'embr', end: 'bayf', time_in_min: 27, final_stop: 'dubl')

BartTravelTime.create(start: 'embr', end: 'cast', time_in_min: 31, final_stop: 'dubl')
BartTravelTime.create(start: 'embr', end: 'dubl', time_in_min: 44, final_stop: 'dubl')



## from embarcadero ('pitt'(yellow), 'frmt'(green) lines)
BartTravelTime.create(start: 'embr', end: 'woak', time_in_min: 7, final_stop: 'pitt')
BartTravelTime.create(start: 'embr', end: 'woak', time_in_min: 7, final_stop: 'dubl')
BartTravelTime.create(start: 'embr', end: 'woak', time_in_min: 7, final_stop: 'frmt')

BartTravelTime.create(start: 'embr', end: '12th', time_in_min: 11, final_stop: 'pitt')
BartTravelTime.create(start: 'embr', end: '19th', time_in_min: 12, final_stop: 'pitt')
BartTravelTime.create(start: 'embr', end: 'mcar', time_in_min: 16, final_stop: 'pitt')

BartTravelTime.create(start: 'embr', end: 'rock', time_in_min: 20, final_stop: 'pitt')
BartTravelTime.create(start: 'embr', end: 'orin', time_in_min: 25, final_stop: 'pitt')
BartTravelTime.create(start: 'embr', end: 'lafy', time_in_min: 30, final_stop: 'pitt')
BartTravelTime.create(start: 'embr', end: 'wcrk', time_in_min: 34, final_stop: 'pitt')
BartTravelTime.create(start: 'embr', end: 'phil', time_in_min: 37, final_stop: 'pitt')
BartTravelTime.create(start: 'embr', end: 'conc', time_in_min: 42, final_stop: 'pitt')
BartTravelTime.create(start: 'embr', end: 'ncon', time_in_min: 46, final_stop: 'pitt')
BartTravelTime.create(start: 'embr', end: 'pitt', time_in_min: 52, final_stop: 'pitt')

BartTravelTime.create(start: 'embr', end: 'lake', time_in_min: 12, final_stop: 'frmt')
BartTravelTime.create(start: 'embr', end: 'ftvl', time_in_min: 16, final_stop: 'frmt')
BartTravelTime.create(start: 'embr', end: 'cols', time_in_min: 19, final_stop: 'frmt')
BartTravelTime.create(start: 'embr', end: 'sanl', time_in_min: 23, final_stop: 'frmt')
BartTravelTime.create(start: 'embr', end: 'bayf', time_in_min: 27, final_stop: 'frmt')

BartTravelTime.create(start: 'embr', end: 'hayw', time_in_min: 30, final_stop: 'frmt')
BartTravelTime.create(start: 'embr', end: 'shay', time_in_min: 34, final_stop: 'frmt')
BartTravelTime.create(start: 'embr', end: 'ucty', time_in_min: 39, final_stop: 'frmt')
BartTravelTime.create(start: 'embr', end: 'frmt', time_in_min: 45, final_stop: 'frmt')


##from montgomery ('rich'(red), 'dubl'(blue) lines)
BartTravelTime.create(start: 'mont', end: 'woak', time_in_min: 9, final_stop: 'rich')
BartTravelTime.create(start: 'mont', end: '12th', time_in_min: 13, final_stop: 'rich')
BartTravelTime.create(start: 'mont', end: '19th', time_in_min: 14, final_stop: 'rich')
BartTravelTime.create(start: 'mont', end: 'mcar', time_in_min: 18, final_stop: 'rich')

BartTravelTime.create(start: 'mont', end: 'ashb', time_in_min: 21, final_stop: 'rich')
BartTravelTime.create(start: 'mont', end: 'dbrk', time_in_min: 23, final_stop: 'rich')
BartTravelTime.create(start: 'mont', end: 'nbrk', time_in_min: 26, final_stop: 'rich')
BartTravelTime.create(start: 'mont', end: 'plza', time_in_min: 29, final_stop: 'rich')
BartTravelTime.create(start: 'mont', end: 'deln', time_in_min: 32, final_stop: 'rich')
BartTravelTime.create(start: 'mont', end: 'rich', time_in_min: 36, final_stop: 'rich')

BartTravelTime.create(start: 'mont', end: 'lake', time_in_min: 14, final_stop: 'dubl')
BartTravelTime.create(start: 'mont', end: 'ftvl', time_in_min: 18, final_stop: 'dubl')
BartTravelTime.create(start: 'mont', end: 'cols', time_in_min: 21, final_stop: 'dubl')
BartTravelTime.create(start: 'mont', end: 'sanl', time_in_min: 25, final_stop: 'dubl')
BartTravelTime.create(start: 'mont', end: 'bayf', time_in_min: 29, final_stop: 'dubl')

BartTravelTime.create(start: 'mont', end: 'cast', time_in_min: 33, final_stop: 'dubl')
BartTravelTime.create(start: 'mont', end: 'dubl', time_in_min: 46, final_stop: 'dubl')

##from montgomery ('pitt'(yellow), 'frmt'(green) lines)
BartTravelTime.create(start: 'mont', end: 'woak', time_in_min: 9, final_stop: 'pitt')
BartTravelTime.create(start: 'mont', end: 'woak', time_in_min: 9, final_stop: 'dubl')
BartTravelTime.create(start: 'mont', end: 'woak', time_in_min: 9, final_stop: 'frmt')

BartTravelTime.create(start: 'mont', end: '12th', time_in_min: 13, final_stop: 'pitt')
BartTravelTime.create(start: 'mont', end: '19th', time_in_min: 14, final_stop: 'pitt')
BartTravelTime.create(start: 'mont', end: 'mcar', time_in_min: 18, final_stop: 'pitt')

BartTravelTime.create(start: 'mont', end: 'rock', time_in_min: 22, final_stop: 'pitt')
BartTravelTime.create(start: 'mont', end: 'orin', time_in_min: 27, final_stop: 'pitt')
BartTravelTime.create(start: 'mont', end: 'lafy', time_in_min: 32, final_stop: 'pitt')
BartTravelTime.create(start: 'mont', end: 'wcrk', time_in_min: 36, final_stop: 'pitt')
BartTravelTime.create(start: 'mont', end: 'phil', time_in_min: 39, final_stop: 'pitt')
BartTravelTime.create(start: 'mont', end: 'conc', time_in_min: 44, final_stop: 'pitt')
BartTravelTime.create(start: 'mont', end: 'ncon', time_in_min: 48, final_stop: 'pitt')
BartTravelTime.create(start: 'mont', end: 'pitt', time_in_min: 54, final_stop: 'pitt')

BartTravelTime.create(start: 'mont', end: 'lake', time_in_min: 14, final_stop: 'frmt')
BartTravelTime.create(start: 'mont', end: 'ftvl', time_in_min: 18, final_stop: 'frmt')
BartTravelTime.create(start: 'mont', end: 'cols', time_in_min: 21, final_stop: 'frmt')
BartTravelTime.create(start: 'mont', end: 'sanl', time_in_min: 25, final_stop: 'frmt')
BartTravelTime.create(start: 'mont', end: 'bayf', time_in_min: 29, final_stop: 'frmt')

BartTravelTime.create(start: 'mont', end: 'hayw', time_in_min: 32, final_stop: 'frmt')
BartTravelTime.create(start: 'mont', end: 'shay', time_in_min: 36, final_stop: 'frmt')
BartTravelTime.create(start: 'mont', end: 'ucty', time_in_min: 41, final_stop: 'frmt')
BartTravelTime.create(start: 'mont', end: 'frmt', time_in_min: 47, final_stop: 'frmt')

##from powell ('rich'(red), 'dubl'(blue) lines)
BartTravelTime.create(start: 'powl', end: 'woak', time_in_min: 11, final_stop: 'rich')
BartTravelTime.create(start: 'powl', end: '12th', time_in_min: 15, final_stop: 'rich')
BartTravelTime.create(start: 'powl', end: '19th', time_in_min: 16, final_stop: 'rich')
BartTravelTime.create(start: 'powl', end: 'mcar', time_in_min: 20, final_stop: 'rich')
BartTravelTime.create(start: 'powl', end: 'ashb', time_in_min: 23, final_stop: 'rich')
BartTravelTime.create(start: 'powl', end: 'dbrk', time_in_min: 25, final_stop: 'rich')
BartTravelTime.create(start: 'powl', end: 'nbrk', time_in_min: 28, final_stop: 'rich')
BartTravelTime.create(start: 'powl', end: 'plza', time_in_min: 31, final_stop: 'rich')
BartTravelTime.create(start: 'powl', end: 'deln', time_in_min: 34, final_stop: 'rich')
BartTravelTime.create(start: 'powl', end: 'rich', time_in_min: 38, final_stop: 'rich')

BartTravelTime.create(start: 'powl', end: 'lake', time_in_min: 16, final_stop: 'dubl')
BartTravelTime.create(start: 'powl', end: 'ftvl', time_in_min: 20, final_stop: 'dubl')
BartTravelTime.create(start: 'powl', end: 'cols', time_in_min: 23, final_stop: 'dubl')
BartTravelTime.create(start: 'powl', end: 'sanl', time_in_min: 27, final_stop: 'dubl')
BartTravelTime.create(start: 'powl', end: 'bayf', time_in_min: 31, final_stop: 'dubl')

BartTravelTime.create(start: 'powl', end: 'cast', time_in_min: 35, final_stop: 'dubl')
BartTravelTime.create(start: 'powl', end: 'dubl', time_in_min: 48, final_stop: 'dubl')

##from powell ('pitt'(yellow), 'frmt'(green) lines)
BartTravelTime.create(start: 'powl', end: 'woak', time_in_min: 11, final_stop: 'pitt')
BartTravelTime.create(start: 'powl', end: 'woak', time_in_min: 11, final_stop: 'dubl')
BartTravelTime.create(start: 'powl', end: 'woak', time_in_min: 11, final_stop: 'frmt')

BartTravelTime.create(start: 'powl', end: '12th', time_in_min: 15, final_stop: 'pitt')
BartTravelTime.create(start: 'powl', end: '19th', time_in_min: 16, final_stop: 'pitt')
BartTravelTime.create(start: 'powl', end: 'mcar', time_in_min: 20, final_stop: 'pitt')

BartTravelTime.create(start: 'powl', end: 'rock', time_in_min: 24, final_stop: 'pitt')
BartTravelTime.create(start: 'powl', end: 'orin', time_in_min: 29, final_stop: 'pitt')
BartTravelTime.create(start: 'powl', end: 'lafy', time_in_min: 34, final_stop: 'pitt')
BartTravelTime.create(start: 'powl', end: 'wcrk', time_in_min: 38, final_stop: 'pitt')
BartTravelTime.create(start: 'powl', end: 'phil', time_in_min: 41, final_stop: 'pitt')
BartTravelTime.create(start: 'powl', end: 'conc', time_in_min: 46, final_stop: 'pitt')
BartTravelTime.create(start: 'powl', end: 'ncon', time_in_min: 50, final_stop: 'pitt')
BartTravelTime.create(start: 'powl', end: 'pitt', time_in_min: 56, final_stop: 'pitt')

BartTravelTime.create(start: 'powl', end: 'lake', time_in_min: 16, final_stop: 'frmt')
BartTravelTime.create(start: 'powl', end: 'ftvl', time_in_min: 20, final_stop: 'frmt')
BartTravelTime.create(start: 'powl', end: 'cols', time_in_min: 23, final_stop: 'frmt')
BartTravelTime.create(start: 'powl', end: 'sanl', time_in_min: 27, final_stop: 'frmt')
BartTravelTime.create(start: 'powl', end: 'bayf', time_in_min: 31, final_stop: 'frmt')

BartTravelTime.create(start: 'powl', end: 'hayw', time_in_min: 34, final_stop: 'frmt')
BartTravelTime.create(start: 'powl', end: 'shay', time_in_min: 38, final_stop: 'frmt')
BartTravelTime.create(start: 'powl', end: 'ucty', time_in_min: 43, final_stop: 'frmt')
BartTravelTime.create(start: 'powl', end: 'frmt', time_in_min: 49, final_stop: 'frmt')

##from civir center ('rich'(red), 'dubl'(blue) lines)
BartTravelTime.create(start: 'civc', end: 'woak', time_in_min: 12, final_stop: 'rich')
BartTravelTime.create(start: 'civc', end: '12th', time_in_min: 16, final_stop: 'rich')
BartTravelTime.create(start: 'civc', end: '19th', time_in_min: 17, final_stop: 'rich')
BartTravelTime.create(start: 'civc', end: 'mcar', time_in_min: 21, final_stop: 'rich')
BartTravelTime.create(start: 'civc', end: 'ashb', time_in_min: 24, final_stop: 'rich')
BartTravelTime.create(start: 'civc', end: 'dbrk', time_in_min: 26, final_stop: 'rich')
BartTravelTime.create(start: 'civc', end: 'nbrk', time_in_min: 29, final_stop: 'rich')
BartTravelTime.create(start: 'civc', end: 'plza', time_in_min: 32, final_stop: 'rich')
BartTravelTime.create(start: 'civc', end: 'deln', time_in_min: 35, final_stop: 'rich')
BartTravelTime.create(start: 'civc', end: 'rich', time_in_min: 39, final_stop: 'rich')

BartTravelTime.create(start: 'civc', end: 'lake', time_in_min: 17, final_stop: 'dubl')
BartTravelTime.create(start: 'civc', end: 'ftvl', time_in_min: 21, final_stop: 'dubl')
BartTravelTime.create(start: 'civc', end: 'cols', time_in_min: 24, final_stop: 'dubl')
BartTravelTime.create(start: 'civc', end: 'sanl', time_in_min: 28, final_stop: 'dubl')
BartTravelTime.create(start: 'civc', end: 'bayf', time_in_min: 32, final_stop: 'dubl')

BartTravelTime.create(start: 'civc', end: 'cast', time_in_min: 36, final_stop: 'dubl')
BartTravelTime.create(start: 'civc', end: 'dubl', time_in_min: 49, final_stop: 'dubl')

##from civir center ('pitt'(yellow), 'frmt'(green) lines)
BartTravelTime.create(start: 'civc', end: 'woak', time_in_min: 12, final_stop: 'pitt')
BartTravelTime.create(start: 'civc', end: 'woak', time_in_min: 12, final_stop: 'dubl')
BartTravelTime.create(start: 'civc', end: 'woak', time_in_min: 12, final_stop: 'frmt')

BartTravelTime.create(start: 'civc', end: '12th', time_in_min: 16, final_stop: 'pitt')
BartTravelTime.create(start: 'civc', end: '19th', time_in_min: 17, final_stop: 'pitt')
BartTravelTime.create(start: 'civc', end: 'mcar', time_in_min: 21, final_stop: 'pitt')

BartTravelTime.create(start: 'civc', end: 'rock', time_in_min: 25, final_stop: 'pitt')
BartTravelTime.create(start: 'civc', end: 'orin', time_in_min: 30, final_stop: 'pitt')
BartTravelTime.create(start: 'civc', end: 'lafy', time_in_min: 35, final_stop: 'pitt')
BartTravelTime.create(start: 'civc', end: 'wcrk', time_in_min: 39, final_stop: 'pitt')
BartTravelTime.create(start: 'civc', end: 'phil', time_in_min: 42, final_stop: 'pitt')
BartTravelTime.create(start: 'civc', end: 'conc', time_in_min: 47, final_stop: 'pitt')
BartTravelTime.create(start: 'civc', end: 'ncon', time_in_min: 51, final_stop: 'pitt')
BartTravelTime.create(start: 'civc', end: 'pitt', time_in_min: 57, final_stop: 'pitt')

BartTravelTime.create(start: 'civc', end: 'lake', time_in_min: 17, final_stop: 'frmt')
BartTravelTime.create(start: 'civc', end: 'ftvl', time_in_min: 21, final_stop: 'frmt')
BartTravelTime.create(start: 'civc', end: 'cols', time_in_min: 24, final_stop: 'frmt')
BartTravelTime.create(start: 'civc', end: 'sanl', time_in_min: 28, final_stop: 'frmt')
BartTravelTime.create(start: 'civc', end: 'bayf', time_in_min: 32, final_stop: 'frmt')

BartTravelTime.create(start: 'civc', end: 'hayw', time_in_min: 35, final_stop: 'frmt')
BartTravelTime.create(start: 'civc', end: 'shay', time_in_min: 39, final_stop: 'frmt')
BartTravelTime.create(start: 'civc', end: 'ucty', time_in_min: 44, final_stop: 'frmt')
BartTravelTime.create(start: 'civc', end: 'frmt', time_in_min: 50, final_stop: 'frmt')
