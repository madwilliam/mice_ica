function [oi,seedcenter] = load_basics()
home='/geode2/home/u110/zw72/Carbonate/code/Mouse_WOI'; % EDIT path to software
addpath(genpath(home))
database='GitHubDataSheet.xlsx'; %EDIT name of excel sheet with mice
excelrows=[3 4]; %EDIT lines corresponding to mice to process from excel sheet
[mice,group_index]=excel_reader(database,excelrows); %reads excel sheet, make struct "mice" with necessary filename info
seedcenter=cell2mat(struct2cell(load('Seeds-R01-Revised','seedcenter'))); %final seeds for FC analysis
region=load('Seeds-R01-Revised','regions'); %regions for seeds for FC matrix enrichment
regions=region.regions;
WL=cell2mat(struct2cell(load('GOOD_AFF_WL'))); %final WL for plotting
[oi,seedcenter,WL]=image_system_info(seedcenter,WL,mice); %grab optical instrument specific properties
WL_factor=3*floor(oi.npixels/size(WL,1))/mice(1).info.spat_ds; %factor for plotting WL without weird black bar at the top...change if ever change WL...
end