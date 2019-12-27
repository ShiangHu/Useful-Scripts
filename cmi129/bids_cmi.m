% Global settings
bidsOpt.FileExt = 'edf';
bidsOpt.InteralUse = true;

% Data
data = jsondecode(fileread('sourcedata/set/allData.json'));
data = data.dataStruct;

% general information for dataset_description.json file
% -----------------------------------------------------
generalInfo.Name = 'CMI-HBN-EEG';
generalInfo.Authors = {'Alexander, L. et al'};
generalInfo.HowToAcknowledge = 'Alexander, L. et al. An open resource for transdiagnostic research in pediatric mental health and learning disorders. Sci Data 4, 170181 (2017)';
generalInfo.ReferencesAndLinks = {'https://www.nature.com/articles/sdata2017181#article-info'};
generalInfo.DatasetDOI = '10.1038/sdata.2017.181';

% Readme and changes
% -----------------------------------------------------
README = sprintf('# CMI-HBN-EEG\n\n BIDS converted by Shiang Hu, hushiang{at}126.com, UESTC, Dec 23, 2019');

% Task information for xxxx-eeg.json file
% -----------------------------------------------------
tInfo.TaskName = 'Resting State';
tInfo.InstitutionName =  'Child Mind Institute';
tInfo.PowerLineFrequency = 60;
tInfo.EEGPlacementScheme = 'GSN_HydroCel_129';
tInfo.Manufacturer = 'EGI';
tInfo.ManufacturersModelName = 'ActiveTwo';

% channel location file
% ---------------------
chanlocs = 'sourcedata/GSN_HydroCel_129.sfp';

% coordsystem string
% This string will be placed in each coordsystem.json
% ---------------------
coordsys = '{"EEGCoordinateSystem":"Other","EEGCoordinateUnits":"metres"}';
           
% call to the export function
% ---------------------------
bids_export(data, 'targetdir', uigetdir, 'taskName', ...
    generalInfo.Name, 'gInfo', generalInfo, 'coordsys', coordsys, ...
    'chanlocs', chanlocs, 'README', README, 'bidsOpt', bidsOpt,'tInfo',tInfo);

disp('Done');