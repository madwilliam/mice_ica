function mice_data = load_mice(mice_id)
    time_points = [15,22,28,35,60];
    [oi,seedcenter] = load_basics();
    mice_data = zeros(78,78,26,2,5,6);
    id = 1;
    for time = time_points
        for fc = 1:6
            file = dir(['/N/slate/zw72/allfiles/Mouse' num2str(mice_id) '-*-P' num2str(time) '-fc' num2str(fc) '.mat']);
            if length(file)>0
                file_name = [file.folder,'/',file.name];
                load(file_name,'isbrain2') % load mask
                load(file_name,'all_contrasts2') % load data to run FC on
                [R_Data,~]=calc_fc(all_contrasts2,isbrain2,seedcenter,oi);
                mice_data(:,:,:,:,id,fc) = R_Data;
            end
        end
        id = id+1;
    end
end